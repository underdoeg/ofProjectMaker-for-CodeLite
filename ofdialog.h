#ifndef OFDIALOGUE_H
#define OFDIALOGUE_H

#include "wx/wx.h" // Base class: wxDialog

class OfDialog : public wxDialog {

public:
	OfDialog(wxWindow* parent);

	void openPathDialog(wxCommandEvent& e);
	void ok(wxCommandEvent& e);
	void cancel(wxCommandEvent& e);

	wxString pathToProject;
	wxString projectName;

private:
	wxTextCtrl* projPath;
	wxTextCtrl* projName;
};

#endif // OFDIALOGUE_H
