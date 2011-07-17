#include "ofmaker.h"
#include <wx/xrc/xmlres.h>
#include <wx/wx.h>
#include <wx/wizard.h>

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
	item = new wxMenuItem(menu, XRCID("new_of"), _("New OF Project Wizard..."), wxEmptyString, wxITEM_NORMAL);
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
	ofDialog->Show();
}
