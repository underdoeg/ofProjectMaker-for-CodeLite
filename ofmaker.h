#ifndef __ofMaker__
#define __ofMaker__

#include "plugin.h"
#include "ofdialog.h"

class ofMaker : public IPlugin
{
public:
	ofMaker(IManager *manager);
	~ofMaker();

	//--------------------------------------------
	//Abstract methods
	//--------------------------------------------
	virtual clToolBar *CreateToolBar(wxWindow *parent);
	virtual void CreatePluginMenu(wxMenu *pluginsMenu);
	virtual void HookPopupMenu(wxMenu *menu, MenuType type);
	virtual void UnHookPopupMenu(wxMenu *menu, MenuType type);
	virtual void UnPlug();

	//PLugin methods
	void onNewOf(wxCommandEvent &e);
};

#endif //ofMaker

