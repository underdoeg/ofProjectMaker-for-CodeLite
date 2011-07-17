/*********************************************************************
 * Name:      	main.cpp
 * Purpose:   	Implements simple wxWidgets application with GUI.
 * Author:    
 * Created:   
 * Copyright: 
 * License:   	wxWidgets license (www.wxwidgets.org)
 * 
 * Notes:		
 *********************************************************************/
 
#include <wx/wx.h>
#include "ofdialog.h"

// application class
class wxMiniApp : public wxApp
{
    public:
		// function called at the application initialization
        virtual bool OnInit();

		// event handler for button click
        void OnClick(wxCommandEvent& event) { GetTopWindow()->Close(); }
};

IMPLEMENT_APP(wxMiniApp);

bool wxMiniApp::OnInit()
{
	OfDialog ofDialog(NULL);
	ofDialog.Show();

	// enter the application's main loop
    return true;
}
