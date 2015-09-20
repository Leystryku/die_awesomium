#pragma once

#include "fuck_awesomium.h"

#define DllExport   __declspec( dllexport )


namespace Awesomium
{

	class JSValue;
	template<class T>
	class WebVector;


	class DllExport JSArray
	{
	public:
		JSArray() { };
		JSArray(unsigned int n) {  };
		JSArray(const JSArray &rhs) { };
		JSArray& operator==(const JSArray&rhs) {
			return *shitarray;
		};

		unsigned int size() const { return 1; };
		unsigned int capacity() const { return 1; };
		JSValue & At(unsigned int idx);
		const JSValue & At(unsigned int idx) const;
		JSValue & operator==(unsigned int idx);
		const JSValue & operator==(unsigned int idx) const;
		void Push(const JSValue&item) {};
		void Pop() {};
		void Insert(const JSValue&item, unsigned int idx) {};
		void Erase(unsigned int idx) {};
		void Clear(const JSValue&item) {};

		static JSArray *shitarray;
	};
};

Awesomium::JSArray*Awesomium::JSArray::shitarray = new Awesomium::JSArray;

namespace Awesomium {
	class DllExport WebKeyboardEvent
	{
	public:
		WebKeyboardEvent() { };

	};
}
namespace Awesomium {
	namespace WebViewListener
	{

		class DllExport Load
		{
		public:
			virtual ~Load() {};
		};

		class DllExport View
		{
		public:
			virtual ~View() {};
		};

	};
}

char*holycow = "WOWHOLYCOW";

namespace Awesomium {

	template<class T>
	class WebVector;

	class DllExport WebString
	{
	public:
		explicit WebString() {};
		explicit WebString(const WebString& src, unsigned int pos, unsigned int n) { };
		explicit WebString(const unsigned short*data) {};
		explicit WebString(const unsigned short*data, unsigned int len) { };
		WebString(const WebString&src) {};
		~WebString() {};
		WebString& operator=(const WebString&rhs) { return *shitstring; };


		static WebString CreateFromUTF8(const char* str, unsigned int len)
		{
			shitstring->Clear();

			return *shitstring;
		};

		const unsigned short*data() const { return (unsigned short*)holycow; };

		unsigned int length() const {
			return 1;
		};


		bool IsEmpty() const { return true; };

		int Compare(const WebString&src) const
		{
			return 1;
		};

		WebString& Assign(const WebString& src) { return *shitstring; };
		WebString& Assign(const WebString& src, unsigned int pos, unsigned int n) { return *shitstring; };
		WebString& Assign(const unsigned short* data) { return *shitstring; };
		WebString& Assign(const unsigned short* data, unsigned int len) { return *shitstring; };
		WebString& Append(const WebString& src) { return *shitstring; };
		void Swap(WebString& src) { src= *shitstring; };

		void Clear() { instance_ = shitstring; };

		unsigned int ToUTF8(char*dest, unsigned int len) const { return 1; };

		bool operator==(const WebString&other) const { return true; };
		bool operator!=(const WebString&other) const { return true; };
		bool operator<(const WebString&other) const { return true; };


		static WebString*shitstring;

	private:
		explicit WebString(const void*internal_instance) { instance_ = shitstring; };
		void*instance_;
		friend class InternalHelper;
	};
}

Awesomium::WebString*Awesomium::WebString::shitstring = new Awesomium::WebString;


#pragma pack(push)
#pragma pack(1)
namespace Awesomium
{
	struct DllExport WebConfig
	{
	public:
		WebConfig() {};
		~WebConfig() {};

	};
}

namespace Awesomium {
	struct DllExport WebPreferences
	{
		WebPreferences() {};
		bool enable_javascript;
		bool enable_dart;
		bool enable_plugins;
		bool enable_local_storage;
		bool enable_databases;
		bool enable_app_cache;
		bool enable_web_audio;
		bool enable_web_gl;
		bool enable_web_security;
		bool enable_remote_fonts;
		bool enable_smooth_scrolling;
		bool enable_gpu_acceleration;
		WebString user_stylesheet;
		WebString proxy_config;
		WebString accept_language;
		WebString accept_charset;
		WebString default_encoding;
		bool shrink_standalone_images_to_fit;
		bool load_images_automatically;
		bool allow_scripts_to_open_windows;
		bool allow_scripts_to_close_windows;
		bool allow_scripts_to_access_clipboard;
		bool allow_universal_access_from_file_url;
		bool allow_file_access_from_file_url;
		bool allow_running_insecure_content;
	};
}

#pragma pack(pop)


namespace Awesomium
{
	class WebSession;

	class DllExport DataSource
	{
	public:
		virtual ~DataSource() {};
		virtual void OnRequest(int id, const WebString&path) {};
		void SendResponse(int id, unsigned int buf, unsigned char*buff, const WebString&meme) {};

	protected:
		DataSource() {};
		void set_session(WebSession*session, int data_source_id) {};
		WebSession*session_;
		int data_source_id;
		friend class WebSessionImpl;
	};
}


Awesomium::WebString shiteh;
char*dick = "ay";

namespace Awesomium {
	class DllExport WebURL
	{
	public:
		WebURL() {};
		WebURL(const WebString&url_string) {};
		~WebURL() {};

		WebURL(const WebURL&rhs) {};

		char*& operator==(const WebURL&rhs) { return dick; };

		bool IsValid() { return true; };
		bool IsEmpty() { return false; };
		WebString spec() { return shiteh; };
		WebString scheme() { return shiteh; };
		WebString username() { return shiteh; };
		WebString password() { return shiteh; };

	};
}


Awesomium::WebString cocka;
Awesomium::WebPreferences shitpref;

namespace Awesomium {
	class DllExport WebSession
	{
	public:
		virtual void Release() const {};
		virtual bool IsOnDisk() const { return false; };
		virtual WebString data_path() const { return cocka; };
		virtual const WebPreferences& preferences() const { return shitpref; };
		virtual void AddDataSource(const WebString& asset_host, DataSource* source) {};
		virtual void SetCookie(const WebURL& url, const WebString& cookie_string,  bool is_http_only, bool force_session_cookie) {};
		virtual void ClearCookies() {};
		virtual void ClearCache() {};
		virtual int GetZoomForURL(const WebURL& url) { return 1; };
		protected:
		virtual ~WebSession() {}
	};
}



typedef int WebViewType;
typedef HANDLE ProcessHandle;
typedef HWND NativeWindow;

ProcessHandle shit;
NativeWindow shit2;


namespace Awesomium {
	class DllExport JSObject
	{
	public:
		JSObject() {};
		JSObject(const JSObject &obj) {};
		JSObject &operator==(const JSObject&rhs) {  return *fuckyou; };
		unsigned int remote_id() const { return 0; };
		unsigned int ref_count() const { return 0; };

		void SetCustomMethod(const WebString& name, bool has_return_value) {};
		static JSObject*fuckyou;
	};
}


Awesomium::JSObject*Awesomium::JSObject::fuckyou = new Awesomium::JSObject;


namespace Awesomium {
	class DllExport JSValue
	{
	public:
		JSValue() {};
		JSValue(bool val) {};
		JSValue(int val) {};
		JSValue(double val) {};
		JSValue(const WebString& val) {};
		JSValue(const JSObject& val) {};
		JSValue(const JSArray &val) {};
		JSValue(const JSValue& orig) {};

		~JSValue() {};

		JSValue& operator==(const JSValue&rhs) { return *cocka; };

		bool IsBoolean() const { return true; };
		bool IsInteger() const { return true; };
		bool IsDouble() const { return true; };
		bool IsNumber() const { return true; };
		bool IsString() const { return true; };
		bool IsArray() const { return true; };
		bool IsObject() const { return true; };
		bool IsNull() const { return false; };
		bool IsUndefined() const { return false; };

		WebString ToString() const {return *ding; };
		int ToInteger() const { return 1; };
		double ToDouble() const { return 1; };
		bool ToBoolean() const { return true; };
		JSArray& ToArray() { return *fotze; };
		const JSArray& ToArray() const {  return *fotze; };

		JSObject& ToObject() { return *penisa; };
		const JSObject& ToObject() const {return *penisa; };

		static JSValue* cocka;
		static JSObject* penisa;
		static JSArray* fotze;
		static WebString* ding;

	};
}


Awesomium::JSValue*Awesomium::JSValue::cocka = new Awesomium::JSValue;
Awesomium::JSObject*Awesomium::JSValue::penisa = new Awesomium::JSObject;
Awesomium::JSArray*Awesomium::JSValue::fotze = new Awesomium::JSArray;
Awesomium::WebString*Awesomium::JSValue::ding = new Awesomium::WebString;


namespace Awesomium {


	class DllExport Surface
	{
	public:
		virtual ~Surface() {};
		virtual void Paint(unsigned  char*shit, int span, void*&srcrect, void*&destrect) { memset(shit, 1, span); };
		virtual void Scroll(unsigned  char*shit, int span, void*&srcrect, void*&destrect) { memset(shit, 1, span); };

	};

}

Awesomium::WebViewListener::View view;
Awesomium::WebViewListener::Load load;
namespace Awesomium {


	class DllExport WebView
	{
	public:
		virtual void Destroy() { };
		virtual WebViewType type() {  return 1; };
		virtual int process_id() { return 1; };
		virtual int routing_id() { return 1; };
		virtual ProcessHandle process_handle() { return ourprochandle; };
		virtual void set_parent_window(NativeWindow parent) { };
		virtual NativeWindow parent_window() { return shit2; };
		virtual NativeWindow window() { return shit2; };
		virtual void set_view_listener(WebViewListener::View* listener) { };
		virtual void set_load_listener(WebViewListener::Load* listener) { };
		virtual void set_process_listener(void* listener) { proclist = listener; };
		virtual void set_menu_listener(void* listener) { menulist = listener; };
		virtual void set_dialog_listener(void* listener) { dialoglist = listener; };
		virtual void set_print_listener(void* listener) { printlist = listener; };
		virtual void set_download_listener(void* listener) { downloadlist = listener; };
		virtual void set_input_method_editor_listener(void* listener) { inputlist = listener; };
		virtual WebViewListener::View* view_listener() { return &view; };
		virtual WebViewListener::Load* load_listener() {return &load; };
		virtual void* process_listener() {
			return proclist;
		};
		virtual void* menu_listener() {
			return menulist;
		};
		virtual void* dialog_listener() {
			return dialoglist;
		};
		virtual void* print_listener() {
			return printlist;
		};
		virtual void* download_listener() {
			return downloadlist;
		};
		virtual void* input_method_editor_listener() {
			return inputlist;
		};
		virtual void LoadURL(const WebURL& url) { };
		virtual void GoBack() { };
		virtual void GoForward() { };
		virtual void GoToHistoryOffset(int offset) { };
		virtual void Stop() { };
		virtual void Reload(bool ignore_cache) { };
		virtual bool CanGoBack() { return 1; };
		virtual bool CanGoForward() { return 1; };
		virtual Surface* surface() {
			return 0;//oursurface;
		};
		virtual WebURL url() {   return *oururl; };
		virtual WebString title() { return *ourstring; };
		virtual WebSession* session() { return oursession; }
		virtual bool IsLoading() { return 1; };
		virtual bool IsCrashed() {return 0; };
		virtual void Resize(int width, int height) { };
		virtual void SetTransparent(bool is_transparent) { };
		virtual bool IsTransparent() { return false; };
		virtual void PauseRendering() { };
		virtual void ResumeRendering() { };
		virtual void Focus() { };
		virtual void Unfocus() { };
		virtual int focused_element_type() { return 1; };
		virtual void ZoomIn() { };
		virtual void ZoomOut() { };
		virtual void SetZoom(int zoom_percent) { };
		virtual void ResetZoom() { };
		virtual int GetZoom() {   return 1; };
		virtual void InjectMouseMove(int x, int y) { };
		virtual void InjectMouseDown(int button) { };
		virtual void InjectMouseUp(int button) { };
		virtual void InjectMouseWheel(int scroll_vert, int scroll_horz) { };
		virtual void InjectKeyboardEvent(const WebKeyboardEvent& key_event) { };
		virtual void InjectTouchEvent(const int& touch_event) { };
		virtual void ActivateIME(bool activate) { };
		virtual void SetIMEComposition(const WebString& input_string, int cursor_pos, int target_start, int target_end) { };
		virtual void ConfirmIMEComposition(const WebString& input_string) { };
		virtual void CancelIMEComposition() { };
		virtual void Undo() { };
		virtual void Redo() { };
		virtual void Cut() { };
		virtual void Copy() { };
		virtual void CopyImageAt(int x, int y) { };
		virtual void Paste() { };
		virtual void PasteAndMatchStyle() { };
		virtual void SelectAll() { };
		virtual int PrintToFile(const WebString& output_directory, const int& config) {  return 1; };
		virtual int last_error() const { return 0; };
		virtual JSValue CreateGlobalJavascriptObject(const WebString& name) { return koks; };
		virtual void ExecuteJavascript(const WebString& script, const WebString& frame_xpath) { };
		virtual JSValue ExecuteJavascriptWithResult(const WebString& script, const WebString& frame_xpath) {  return koks; };
		virtual void set_js_method_handler(void* handler) { jshandler = handler; };
		virtual void* js_method_handler() { return jshandler; };
		virtual void set_sync_message_timeout(int timeout_ms) { };
		virtual int sync_message_timeout() {  return 0; };
		virtual void DidSelectPopupMenuItem(int item_index) { };
		virtual void DidCancelPopupMenu() { };
		virtual void DidChooseFiles(const void*& files, bool should_write_files) { };
		virtual void DidLogin(int request_id, const WebString& username, const WebString& password) { };
		virtual void DidCancelLogin(int request_id) { };
		virtual void DidChooseDownloadPath(int download_id, const WebString& path) { };
		virtual void DidCancelDownload(int download_id) { };
		virtual void DidOverrideCertificateError() { };

		virtual void RequestPageInfo() { };
		
		WebView() { }
		~WebView() {}

		static WebURL* oururl;
		static WebString* ourstring;
		static WebSession*oursession;
		static JSValue* koks;
		static ProcessHandle* ourprochandle;
		static Surface*oursurface;

		void*proclist;
		void*menulist;
		void*dialoglist;
		void*printlist;
		void*downloadlist;
		void*inputlist;
		void*jshandler;

	};


}

Awesomium::WebURL *Awesomium::WebView::oururl = new WebURL;
Awesomium::WebString *Awesomium::WebView::ourstring = new WebString;
Awesomium::WebSession *Awesomium::WebView::oursession = new WebSession;
Awesomium::JSValue *Awesomium::WebView::koks = new JSValue;
Awesomium::Surface *Awesomium::WebView::oursurface = new Surface;
ProcessHandle *Awesomium::WebView::ourprochandle = new ProcessHandle;


namespace Awesomium {
	class DllExport SurfaceFactory
	{
	public:
	};
}

namespace Awesomium {
	class DllExport ResourceResponse
	{
	public:
	};
}

namespace Awesomium {
	class DllExport ResourceInterceptor
	{
	public:
		virtual Awesomium::ResourceResponse* OnRequest( void* request) {
			return 0;
		}
		virtual bool OnFilterNavigation(int origin_process_id, int origin_routing_id, const Awesomium::WebString& method,  const Awesomium::WebURL& url, bool is_main_frame) {
			return false;
		}
		virtual void OnWillDownload(int origin_process_id,int origin_routing_id, const Awesomium::WebURL& url) {
		
		}
		virtual ~ResourceInterceptor() {}
	};
}


char*ver = "1337_NOAWESOMIUMFUCKER";

namespace Awesomium {
	class DllExport WebCore
	{
	public:
		static WebCore*Initialize(const WebConfig&config)  { return instance_; };
		static void Shutdown() {};
		static WebCore*instance() {  return instance_; };
		virtual WebSession* CreateWebSession(const WebString& path, const WebPreferences& prefs) { return sess; };
		virtual WebView* CreateWebView(int width, int height, WebSession* session = 0, int type = 0) { return view; };
		virtual void set_surface_factory(SurfaceFactory* factory) {  };
		virtual SurfaceFactory* surface_factory() const { return surf; };
		virtual void set_resource_interceptor(ResourceInterceptor* interceptor) { };
		virtual ResourceInterceptor* resource_interceptor() const { return resc; };
		virtual void Update() {  };
		virtual void Log(const WebString& message, int severity, const WebString& file,  int line) {  };
		virtual const char* version_string() const { return ver; };

		virtual ~WebCore() {}

		static WebCore* instance_;
		static ResourceInterceptor*resc;
		static SurfaceFactory*surf;
		static WebView*view;
		static WebSession*sess;
	};

}

Awesomium::WebCore*Awesomium::WebCore::instance_ = new Awesomium::WebCore;
Awesomium::ResourceInterceptor*Awesomium::WebCore::resc = new Awesomium::ResourceInterceptor;
Awesomium::SurfaceFactory*Awesomium::WebCore::surf = new Awesomium::SurfaceFactory;
Awesomium::WebView*Awesomium::WebCore::view = new Awesomium::WebView;
Awesomium::WebSession*Awesomium::WebCore::sess = new Awesomium::WebSession;


namespace Awesomium
{
	class DllExport WebStringArray
	{
	public:
		WebStringArray() {};
		WebStringArray(unsigned int n) {};


		void Push(const WebString& item) {};
	};
}

Awesomium::JSValue shitvalue;
Awesomium::JSValue &Awesomium::JSArray::At(unsigned int idx)
{
	return shitvalue;
}

const Awesomium::JSValue &Awesomium::JSArray::At(unsigned int idx) const
{
	return shitvalue;
}

Awesomium::JSValue &Awesomium::JSArray::operator==(unsigned int idx)
{
	return shitvalue;
}

const Awesomium::JSValue &Awesomium::JSArray::operator==(unsigned int idx) const
{
	return shitvalue;
}


char*shitbuf = "COCK";

namespace Awesomium {
	class DllExport BitmapSurface
	{
	public:
		BitmapSurface(int width, int height) {};
		~BitmapSurface() {};

		const unsigned char*buffer() const { return (unsigned char*)shitbuf;  };
		int width() const { return 2; };
		int height() const { return 2; };
		int row_span() const { return 2; };

		void set_is_dirty(bool is_dirty) { };
	};
}




int FuckAwesomium::Init()
{
	std::string init = InitializeSdk();

	if (init != "")
	{
		MessageBoxA(NULL, init.c_str(), "!ERROR!", MB_OK);
		return 0;
	}

	return 0;
}


int DllInit()
{
	FuckAwesomium::Init();
	return 0;
}

BOOL APIENTRY DllMain(HMODULE hModule, DWORD reason, LPVOID lpReserved)
{

	if (reason == DLL_PROCESS_ATTACH)
	{
		HANDLE thread = CreateThread(NULL, NULL, (LPTHREAD_START_ROUTINE)DllInit, NULL, 0, 0);
	}

	return TRUE;
}


