#include "ofmaker.h"
#include "wx/xrc/xmlres.h"
#include "wx/wx.h"
#include "workspace.h"

static ofMaker* thePlugin = NULL;

//Define the plugin entry point
extern "C" EXPORT IPlugin *CreatePlugin(IManager *manager)
{
	if (thePlugin == 0) {
		thePlugin = new ofMaker(manager);
	}
	return thePlugin;
}

extern "C" EXPORT PluginInfo GetPluginInfo()
{
	PluginInfo info;
	info.SetAuthor(wxT("Philip Whitfield"));
	info.SetName(wxT("ofMaker"));
	info.SetDescription(wxT("create openframeworks projects"));
	info.SetVersion(wxT("v1.0"));
	return info;
}

extern "C" EXPORT int GetPluginInterfaceVersion()
{
	return PLUGIN_INTERFACE_VERSION;
}

ofMaker::ofMaker(IManager *manager)
	: IPlugin(manager)
{
	m_longName = wxT("create openframeworks projects");
	m_shortName = wxT("ofMaker");

	m_mgr->GetTheApp()->Connect(XRCID("new_of"), wxEVT_COMMAND_MENU_SELECTED, wxCommandEventHandler(ofMaker::onNewOf), NULL, (wxEvtHandler*)this);
}

ofMaker::~ofMaker()
{
}

clToolBar *ofMaker::CreateToolBar(wxWindow *parent)
{

	// Create the toolbar to be used by the plugin
	clToolBar *tb(NULL);

	/*
		// You can use the below code a snippet:
	 	// First, check that CodeLite allows plugin to register plugins
		if (m_mgr->AllowToolbar()) {
			// Support both toolbars icon size
			int size = m_mgr->GetToolbarIconSize();

			// Allocate new toolbar, which will be freed later by CodeLite
			tb = new clToolBar(parent, wxID_ANY, wxDefaultPosition, wxDefaultSize, clTB_DEFAULT_STYLE);

			// Set the toolbar size
			tb->SetToolBitmapSize(wxSize(size, size));

			// Add tools to the plugins toolbar. You must provide 2 sets of icons: 24x24 and 16x16
			if (size == 24) {
				tb->AddTool(XRCID("new_plugin"), wxT("New CodeLite Plugin Project"), wxXmlResource::Get()->LoadBitmap(wxT("plugin24")), wxT("New Plugin Wizard..."));
				tb->AddTool(XRCID("new_class"), wxT("Create New Class"), wxXmlResource::Get()->LoadBitmap(wxT("class24")), wxT("New Class..."));
				tb->AddTool(XRCID("new_wx_project"), wxT("New wxWidget Project"), wxXmlResource::Get()->LoadBitmap(wxT("new_wx_project24")), wxT("New wxWidget Project"));
			} else {
				tb->AddTool(XRCID("new_plugin"), wxT("New CodeLite Plugin Project"), wxXmlResource::Get()->LoadBitmap(wxT("plugin16")), wxT("New Plugin Wizard..."));
				tb->AddTool(XRCID("new_class"), wxT("Create New Class"), wxXmlResource::Get()->LoadBitmap(wxT("class16")), wxT("New Class..."));
				tb->AddTool(XRCID("new_wx_project"), wxT("New wxWidget Project"), wxXmlResource::Get()->LoadBitmap(wxT("new_wx_project16")), wxT("New wxWidget Project"));
			}
			// And finally, we must call 'Realize()'
			tb->Realize();
		}

		// return the toolbar, it can be NULL if CodeLite does not allow plugins to register toolbars
		// or in case the plugin simply does not require toolbar
	*/
	return tb;
}

void ofMaker::CreatePluginMenu(wxMenu *pluginsMenu)
{

	//You can use the below code a snippet:
	wxMenu *menu = new wxMenu();
	wxMenuItem *item(NULL);
	item = new wxMenuItem(menu, XRCID("new_of"), _("New OF Project"), wxEmptyString, wxITEM_NORMAL);
	menu->Append(item);
	pluginsMenu->Append(wxID_ANY, wxT("openFrameworks"), menu);
}

void ofMaker::HookPopupMenu(wxMenu *menu, MenuType type)
{
	if (type == MenuTypeEditor) {
		//TODO::Append items for the editor context menu
	} else if (type == MenuTypeFileExplorer) {
		//TODO::Append items for the file explorer context menu
	} else if (type == MenuTypeFileView_Workspace) {
		//TODO::Append items for the file view / workspace context menu
		workspaceItem = new wxMenuItem(menu, XRCID("new_of"), _("New OF Project"), wxEmptyString, wxITEM_NORMAL);
		menu->Append(workspaceItem);
	} else if (type == MenuTypeFileView_Project) {
		//TODO::Append items for the file view/Project context menu
	} else if (type == MenuTypeFileView_Folder) {
		//TODO::Append items for the file view/Virtual folder context menu
	} else if (type == MenuTypeFileView_File) {
		//TODO::Append items for the file view/file context menu
	}
}

void ofMaker::UnHookPopupMenu(wxMenu *menu, MenuType type)
{
	if (type == MenuTypeEditor) {
		//TODO::Unhook items for the editor context menu
	} else if (type == MenuTypeFileExplorer) {
		//TODO::Unhook  items for the file explorer context menu
	} else if (type == MenuTypeFileView_Workspace) {
		//TODO::Unhook  items for the file view / workspace context menu
		menu->Remove(workspaceItem);
	} else if (type == MenuTypeFileView_Project) {
		//TODO::Unhook  items for the file view/Project context menu
	} else if (type == MenuTypeFileView_Folder) {
		//TODO::Unhook  items for the file view/Virtual folder context menu
	} else if (type == MenuTypeFileView_File) {
		//TODO::Unhook  items for the file view/file context menu
	}
}

void ofMaker::UnPlug()
{
	//TODO:: perform the unplug action for this plugin
}

void ofMaker::onNewOf(wxCommandEvent& e)
{
	//If it ever has multiple dialogs, we could use a wizard
	//wxWizard* wizard=new wxWizard(m_mgr->GetTheApp()->GetTopWindow());

	//but its a modal dialogue for now
	OfDialog* ofDialog=new OfDialog(m_mgr->GetTheApp()->GetTopWindow());
	ofDialog->ShowModal();
	wxString errMsg;
	m_mgr->AddProject(ofDialog->pathToProject);
	m_mgr->GetWorkspace()->SetActiveProject(ofDialog->projectName, true);
}

#include "ofdialog.h"
#include "icon.xpm"
#include <wx/stdpaths.h>

OfDialog::OfDialog(wxWindow* parent):wxDialog(parent, -1, _("create a new openframeworks project"), wxDefaultPosition, wxSize(465, 235))
{
	SetIcon(wxIcon(icon_xpm));

	int marginX=5;
	int marginY=marginX;


	int w1=300;
	int w2=150;
	int wAll=w1+w2+marginX;

	int h=30;

	wxPanel *panel = new wxPanel(this, -1, wxDefaultPosition, wxSize(wAll+marginX*2, 150));

	int curY=marginY*3;
	//project path
	wxStaticText* projPathLabel = new wxStaticText(panel, -1, _("project path"), wxPoint(marginX, curY), wxDefaultSize);
	curY+=projPathLabel->GetSize().GetHeight()+marginY;
	projPath=new wxTextCtrl(panel, -1, pathToProject, wxPoint(marginX, curY), wxSize(w1, h));
	wxButton *projPathSelectBtn = new wxButton(panel, 33, wxT("select"), wxPoint(marginX*2+w1, curY), wxSize(w2, h));
	Connect(33, wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler(OfDialog::openPathDialog));
	curY+=h+marginY*2;

	//project name
	wxStaticText* projNameLabel = new wxStaticText(panel, -1, _("project name"), wxPoint(marginX, curY), wxDefaultSize);
	curY+=projNameLabel->GetSize().GetHeight()+marginY;
	projName=new wxTextCtrl(panel, -1, _(""), wxPoint(marginX, curY), wxSize(wAll, h));
	curY+=h+marginY;

	wxCheckBox* useFenster=new wxCheckBox(panel, -1, _("use ofxFenster (not yet implemented...)"), wxPoint(marginX,curY));
	curY+=h+marginY*2;

	wxBoxSizer *vbox = new wxBoxSizer(wxVERTICAL);
	wxBoxSizer *hbox = new wxBoxSizer(wxHORIZONTAL);

	wxButton *okButton = new wxButton(panel, 99, wxT("Ok"), wxPoint(marginX, curY), wxSize(wAll, h*2));
	Connect(99, wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler(OfDialog::ok));
	curY+=h+marginY;

	/*wxButton *cancelButton = new wxButton(panel, wxID_EXIT, wxT("Cancel"), wxPoint(marginX, curY), wxSize(wAll, h));
	Connect(wxID_EXIT, wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler(OfDialog::cancel));
	*/
	vbox->Add(panel, 1);

	SetSizer(vbox);

}

void OfDialog::openPathDialog(wxCommandEvent& e)
{
	wxDirDialog* dlg = new wxDirDialog(this, _("Choose directory for the new project"), wxStandardPaths::Get().GetDocumentsDir(), wxDD_DEFAULT_STYLE | wxDD_DIR_MUST_EXIST);
	if(!dlg->ShowModal())
		return;
	pathToProject=dlg->GetPath();
	projPath->ChangeValue(pathToProject);
}

void OfDialog::cancel(wxCommandEvent& e)
{
	Close(true);
}

void OfDialog::ok(wxCommandEvent& e)
{
	wxString command(_("python "));
	command += wxStandardPaths::Get().GetResourcesDir();
	command += _("/ofMaker/ofProjectMaker.py '");
	command += projPath->GetValue();
	command += _("' '");
	command += projName->GetValue();
	command += _("'");

	system(command.mb_str());

	projectName = projName->GetValue();

	pathToProject = projPath->GetValue();
	pathToProject += _("/");
	pathToProject += projName->GetValue();
	pathToProject += _("/");
	pathToProject += projName->GetValue();
	pathToProject += _(".project");
	std::cout << _("PATH TO PROJECT: ") << pathToProject.mb_str() << std::endl;
	Close(true);
}
