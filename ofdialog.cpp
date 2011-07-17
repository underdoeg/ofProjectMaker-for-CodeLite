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
	command += _("/ofProjectMaker.py '");
	command += projPath->GetValue();
	command += _("' '");
	command += projName->GetValue();
	command += _("'");

	system(command.mb_str());

	pathToProject = projPath->GetValue();
	pathToProject += _("/");
	pathToProject += projName->GetValue();
	pathToProject += _(".project");
	std::cout << _("PATH TO PROJECT: ") << pathToProject.mb_str() << std::endl;
	Close(true);
}
