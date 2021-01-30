#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif


#include <Windows.h>

#include "webviewlistener.h"
#include "resourcerequest.h"
#include "surface.h"
#include "websession.h"
#include "webkeyboardevent.h"
#include "jsvalue.h"
#include "weburl.h"
#include "webstring.h"

typedef int WebViewType;
typedef void* ProcessHandle;
typedef HWND NativeWindow;

namespace Awesomium {


	class DllExport WebView
	{
	public:
		virtual void Destroy();
		virtual WebViewType type();
		virtual int process_id();
		virtual int routing_id();
		virtual int next_routing_id();
		virtual ProcessHandle process_handle();
		virtual void set_parent_window(NativeWindow parent);
		virtual NativeWindow parent_window();
		virtual NativeWindow window();
		virtual void set_view_listener(WebViewListener::View* listener);
		virtual void set_load_listener(WebViewListener::Load* listener);
		virtual void set_process_listener(void* listener);
		virtual void set_menu_listener(void* listener);
		virtual void set_dialog_listener(void* listener);
		virtual void set_print_listener(void* listener);
		virtual void set_download_listener(void* listener);
		virtual void set_input_method_editor_listener(void* listener);
		virtual WebViewListener::View* view_listener();
		virtual WebViewListener::Load* load_listener();
		virtual void* process_listener();
		virtual void* menu_listener();
		virtual void* dialog_listener();
		virtual void* print_listener();
		virtual void* download_listener();
		virtual void* input_method_editor_listener();
		virtual void LoadURL(const WebURL& url);
		virtual void GoBack();
		virtual void GoForward();
		virtual void GoToHistoryOffset(int offset);
		virtual void Stop();
		virtual void Reload(bool ignore_cache);
		virtual bool CanGoBack();
		virtual bool CanGoForward();
		virtual Surface* surface();
		virtual WebURL url();
		virtual WebString title();
		virtual WebSession* session();
		virtual bool IsLoading();
		virtual bool IsCrashed();
		virtual void Resize(int width, int height);
		virtual void SetTransparent(bool is_transparent);
		virtual bool IsTransparent();
		virtual void PauseRendering();
		virtual void ResumeRendering();
		virtual void Focus();
		virtual void Unfocus();
		virtual int focused_element_type();
		virtual void ZoomIn();
		virtual void ZoomOut();
		virtual void SetZoom(int zoom_percent);
		virtual void ResetZoom();
		virtual int GetZoom();
		virtual void InjectMouseMove(int x, int y);
		virtual void InjectMouseDown(int button);
		virtual void InjectMouseUp(int button);
		virtual void InjectMouseWheel(int scroll_vert, int scroll_horz);
		virtual void InjectKeyboardEvent(const WebKeyboardEvent& key_event);
		virtual void InjectTouchEvent(const int& touch_event);
		virtual void ActivateIME(bool activate);
		virtual void SetIMEComposition(const WebString& input_string, int cursor_pos, int target_start, int target_end);
		virtual void ConfirmIMEComposition(const WebString& input_string);
		virtual void CancelIMEComposition();
		virtual void Undo();
		virtual void Redo();
		virtual void Cut();
		virtual void Copy();
		virtual void CopyImageAt(int x, int y);
		virtual void Paste();
		virtual void PasteAndMatchStyle();
		virtual void SelectAll();
		virtual int PrintToFile(const WebString& output_directory, const int& config);
		virtual int last_error() const;
		virtual JSValue CreateGlobalJavascriptObject(const WebString& name);
		virtual void ExecuteJavascript(const WebString& script, const WebString& frame_xpath);
		virtual JSValue ExecuteJavascriptWithResult(const WebString& script, const WebString& frame_xpath);
		virtual void set_js_method_handler(void* handler);
		virtual void* js_method_handler();
		virtual void set_sync_message_timeout(int timeout_ms);
		virtual int sync_message_timeout();
		virtual void DidSelectPopupMenuItem(int item_index);
		virtual void DidCancelPopupMenu();
		virtual void DidChooseFiles(const void*& files, bool should_write_files);
		virtual void DidLogin(int request_id, const WebString& username, const WebString& password);
		virtual void DidCancelLogin(int request_id);
		virtual void DidChooseDownloadPath(int download_id, const WebString& path);
		virtual void DidCancelDownload(int download_id);
		virtual void DidOverrideCertificateError();

		virtual void RequestPageInfo();

		virtual void ReduceMemoryUsage();

		WebView();
		~WebView();

		static WebURL* dummyurl;
		static WebString* dummystring;
		static WebSession* dummysession;
		static JSValue* dummyjsvalue;
		static ProcessHandle* dummyprochandle;
		static Surface* dummysurface;

		void* proclist;
		void* menulist;
		void* dialoglist;
		void* printlist;
		void* downloadlist;
		void* inputlist;
		void* jshandler;


	};


}