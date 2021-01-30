#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include <Windows.h>

#include "../webview.h"

#include "../webviewlistener.h"
#include "../resourcerequest.h"
#include "../surface.h"
#include "../websession.h"
#include "../webkeyboardevent.h"
#include "../jsvalue.h"
#include "../weburl.h"
#include "../webstring.h"

namespace Awesomium
{
	ProcessHandle dummyhandle;
	NativeWindow dummywindow;

	WebURL* WebView::dummyurl = new WebURL;
	WebString* WebView::dummystring = new WebString;
	WebSession* WebView::dummysession = new WebSession;
	JSValue* WebView::dummyjsvalue = new JSValue;
	ProcessHandle* WebView::dummyprochandle = new ProcessHandle;
	Surface* WebView::dummysurface = new Surface;

	void WebView::Destroy()
	{
	};

	WebViewType WebView::type()
	{
		return 1;
	};
	int WebView::process_id()
	{
		return 1;
	};

	int WebView::routing_id()
	{
		return 1;
	};

	int WebView::next_routing_id()
	{
		return 1;
	};

	ProcessHandle WebView::process_handle()
	{
		return dummyprochandle;
	};

	void WebView::set_parent_window(NativeWindow parent)
	{
	};

	NativeWindow WebView::parent_window()
	{
		return dummywindow;
	};

	NativeWindow WebView::window()
	{
		return dummywindow;
	};

	void WebView::set_view_listener(WebViewListener::View* listener)
	{

	};

	void WebView::set_load_listener(WebViewListener::Load* listener)
	{
	};

	void WebView::set_process_listener(void* listener)
	{
		proclist = listener;
	};

	void WebView::set_menu_listener(void* listener)
	{
		menulist = listener;
	};

	void WebView::set_dialog_listener(void* listener)
	{
		dialoglist = listener;
	};

	void WebView::set_print_listener(void* listener)
	{
		printlist = listener;
	};

	void WebView::set_download_listener(void* listener)
	{
		downloadlist = listener;
	};

	void WebView::set_input_method_editor_listener(void* listener)
	{
		inputlist = listener;
	};

	WebViewListener::View* WebView::view_listener()
	{
		return ResourceRequest::ourview;
	};

	WebViewListener::Load* WebView::load_listener()
	{
		return ResourceRequest::ourload;
	};

	void* WebView::process_listener()
	{
		return proclist;
	};
	void* WebView::menu_listener()
	{
		return menulist;
	};
	void* WebView::dialog_listener()
	{
		return dialoglist;
	};
	void* WebView::print_listener()
	{
		return printlist;
	};

	void* WebView::download_listener()
	{
		return downloadlist;
	};

	void* WebView::input_method_editor_listener()
	{
		return inputlist;
	};

	void WebView::LoadURL(const WebURL& url)
	{
	};

	void WebView::GoBack()
	{
	};

	void WebView::GoForward()
	{
	};

	void WebView::GoToHistoryOffset(int offset)
	{
	};

	void WebView::Stop()
	{
	};

	void WebView::Reload(bool ignore_cache)
	{ };

	bool WebView::CanGoBack()
	{
		return true;
	};

	bool WebView::CanGoForward()
	{
		return true;
	};

	Surface* WebView::surface()
	{
		return 0;//oursurface;
	};

	WebURL WebView::url()
	{
		return *dummyurl;
	};

	WebString WebView::title()
	{
		return *dummystring;
	};

	WebSession* WebView::session()
	{
		return dummysession;
	}

	bool WebView::IsLoading()
	{
		return 1;
	};

	bool WebView::IsCrashed()
	{
		return 0;
	};

	void WebView::Resize(int width, int height)
	{ };

	void WebView::SetTransparent(bool is_transparent)
	{ };

	bool WebView::IsTransparent()
	{
		return false;
	};

	void WebView::PauseRendering()
	{
	};

	void WebView::ResumeRendering()
	{
	};

	void WebView::Focus()
	{
	};

	void WebView::Unfocus()
	{
	};

	int WebView::focused_element_type()
	{
		return 1;
	};

	void WebView::ZoomIn()
	{
	};

	void WebView::ZoomOut()
	{
	};

	void WebView::SetZoom(int zoom_percent)
	{
	};

	void WebView::ResetZoom()
	{
	};

	int WebView::GetZoom()
	{
		return 1;
	};

	void WebView::InjectMouseMove(int x, int y)
	{
	};

	void WebView::InjectMouseDown(int button)
	{
	};

	void WebView::InjectMouseUp(int button)
	{
	};

	void WebView::InjectMouseWheel(int scroll_vert, int scroll_horz)
	{
	};

	void WebView::InjectKeyboardEvent(const WebKeyboardEvent& key_event)
	{
	};

	void WebView::InjectTouchEvent(const int& touch_event)
	{
	};

	void WebView::ActivateIME(bool activate)
	{
	};

	void WebView::SetIMEComposition(const WebString& input_string, int cursor_pos, int target_start, int target_end)
	{
	};

	void WebView::ConfirmIMEComposition(const WebString& input_string)
	{
	};

	void WebView::CancelIMEComposition()
	{
	};

	void WebView::Undo()
	{
	};

	void WebView::Redo()
	{
	};

	void WebView::Cut()
	{
	};

	void WebView::Copy()
	{
	};

	void WebView::CopyImageAt(int x, int y)
	{
	};

	void WebView::Paste()
	{
	};

	void WebView::PasteAndMatchStyle()
	{
	};

	void WebView::SelectAll()
	{
	};

	int WebView::PrintToFile(const WebString& output_directory, const int& config)
	{
		return 1;
	};

	int WebView::last_error() const
	{
		return 0;
	};

	JSValue WebView::CreateGlobalJavascriptObject(const WebString& name)
	{
		return *dummyjsvalue;
	};

	void WebView::ExecuteJavascript(const WebString& script, const WebString& frame_xpath)
	{ };

	JSValue WebView::ExecuteJavascriptWithResult(const WebString& script, const WebString& frame_xpath)
	{
		return *dummyjsvalue;
	};

	void WebView::set_js_method_handler(void* handler)
	{
		jshandler = handler;
	};

	void* WebView::js_method_handler()
	{
		return jshandler;
	};

	void WebView::set_sync_message_timeout(int timeout_ms)
	{
	};

	int WebView::sync_message_timeout()
	{
		return 0;
	};

	void WebView::DidSelectPopupMenuItem(int item_index)
	{
	};

	void WebView::DidCancelPopupMenu()
	{
	};

	void WebView::DidChooseFiles(const void*& files, bool should_write_files)
	{
	};

	void WebView::DidLogin(int request_id, const WebString& username, const WebString& password)
	{
	};

	void WebView::DidCancelLogin(int request_id)
	{
	};

	void WebView::DidChooseDownloadPath(int download_id, const WebString& path)
	{
	};

	void WebView::DidCancelDownload(int download_id)
	{
	};

	void WebView::DidOverrideCertificateError()
	{
	};


	void WebView::RequestPageInfo()
	{
	};

	void WebView::ReduceMemoryUsage()
	{
	};

	WebView::WebView()
	{
	};

	WebView::~WebView()
	{
	};
}