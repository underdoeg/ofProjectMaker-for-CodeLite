#include "ofdialog.h"
#include "icon.xpm"
#include <wx/stdpaths.h>

OfDialog::OfDialog(wxWindow* parent):wxDialog(parent, -1, _("create a new openframeworks project"), wxDefaultPosition, wxSize(700, 400))
{
	SetIcon(wxIcon(icon_xpm));

	wxPanel *panel = new wxPanel(this, -1, wxDefaultPosition, wxSize(500, 300));

	int marginX=5;
	int marginY=marginX;

	int w1=300;
	int w2=150;
	int wAll=w1+w2+marginX;

	int h=30;

	int curY=marginY;
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
	curY+=h+marginY;

	wxBoxSizer *vbox = new wxBoxSizer(wxVERTICAL);
	wxBoxSizer *hbox = new wxBoxSizer(wxHORIZONTAL);

	wxButton *okButton = new wxButton(this, 99, wxT("Ok"), wxDefaultPosition, wxSize(70, 30));
	Connect(99, wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler(OfDialog::ok));

	wxButton *cancelButton = new wxButton(this, wxID_EXIT, wxT("Cancel"), wxDefaultPosition, wxSize(70, 30));
	Connect(wxID_EXIT, wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler(OfDialog::cancel));

	hbox->Add(okButton, 1);
	hbox->Add(cancelButton, 1, wxLEFT | wxRIGHT, 5);

	vbox->Add(panel, 1);
	vbox->Add(hbox, 0, wxALIGN_RIGHT | wxTOP | wxBOTTOM, 10);

	SetSizer(vbox);

}

void OfDialog::openPathDialog(wxCommandEvent& e)
{
	wxDirDialog* dlg = new wxDirDialog(this, _("Choose directory for the new project"), _(""), wxDD_DEFAULT_STYLE | wxDD_DIR_MUST_EXIST);
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
