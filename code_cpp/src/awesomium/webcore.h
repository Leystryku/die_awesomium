#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "webconfig.h"
#include "webstring.h"
#include "surfacefactory.h"
#include "resourceinterceptor.h"
#include "webview.h"

namespace Awesomium {
	class DllExport WebCore
	{
	public:
		static WebCore*Initialize(const WebConfig&config);
		static void Shutdown();
		static WebCore*instance();
		virtual WebSession* CreateWebSession(const WebString& path, const WebPreferences& prefs);
		virtual WebView* CreateWebView(int width, int height, WebSession* session = 0, int type = 0);
		virtual void set_surface_factory(SurfaceFactory* factory);
		virtual SurfaceFactory* surface_factory() const;
		virtual void set_resource_interceptor(ResourceInterceptor* interceptor);
		virtual ResourceInterceptor* resource_interceptor() const;
		virtual void Update();
		virtual void Log(const WebString& message, int severity, const WebString& file, int line);
		virtual const char* version_string() const;

		static unsigned int used_memory();
		static unsigned int allocated();
		static void release_memory();

		virtual ~WebCore();

		static WebCore* instance_;
		static ResourceInterceptor*resc;
		static SurfaceFactory*surf;
		static WebView*view;
		static WebSession*sess;
	};

}