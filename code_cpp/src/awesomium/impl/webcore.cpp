#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../webcore.h"
#include "../webconfig.h"
#include "../webstring.h"
#include "../surfacefactory.h"
#include "../resourceinterceptor.h"
#include "../webview.h"

namespace Awesomium
{
	char* ver = "1.0.0_Leystryku";

	WebCore* WebCore::instance_ = new WebCore;
	ResourceInterceptor* WebCore::resc = new ResourceInterceptor;
	SurfaceFactory* WebCore::surf = new SurfaceFactory;
	WebView* WebCore::view = new WebView;
	WebSession* WebCore::sess = new WebSession;

	WebCore* WebCore::Initialize(const WebConfig& config)
	{
		return instance_;
	};

	void WebCore::Shutdown()
	{
	};

	WebCore* WebCore::instance()
	{
		return instance_;
	};

	WebSession* WebCore::CreateWebSession(const WebString& path, const WebPreferences& prefs)
	{
		return sess;
	};

	WebView* WebCore::CreateWebView(int width, int height, WebSession* session, int type)
	{
		return view;
	};

	void WebCore::set_surface_factory(SurfaceFactory* factory)
	{
	};

	SurfaceFactory* WebCore::surface_factory() const
	{
		return surf;
	};

	void WebCore::set_resource_interceptor(ResourceInterceptor* interceptor)
	{
	};

	ResourceInterceptor* WebCore::resource_interceptor() const
	{
		return resc;
	};

	void WebCore::Update()
	{
	};

	void WebCore::Log(const WebString& message, int severity, const WebString& file, int line)
	{
	};

	const char* WebCore::version_string() const
	{
		return ver;
	};


	unsigned int WebCore::used_memory()
	{
		return 0; // :-) If only it was this easy!
	}

	unsigned int WebCore::allocated()
	{
		return 128; // :-) If only it was this easy!
	}

	void WebCore::release_memory()
	{
	};

	WebCore::~WebCore()
	{
	}

}