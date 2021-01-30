#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "jsarray.h"
#include "jsvalue.h"
#include "webview.h"
#include "webstring.h"


namespace Awesomium
{
	enum JSObjectType {
		kJSObjectType_Local,
		kJSObjectType_Remote,
		kJSObjectType_RemoteGlobal,
	};

	enum Error {
		kError_None = 0,
		kError_BadParameters,
		kError_ObjectGone,
		kError_ConnectionGone,
		kError_TimedOut,
		kError_WebViewGone,
		kError_Generic,
	};

	class DllExport JSObject
	{
	public:

		JSObject() {};
		JSObject(const JSObject& obj) {};
		JSObject& operator=(const JSObject& rhs);
		unsigned int remote_id() const;
		int ref_count() const;

		JSObjectType type() const;
		WebView* owner() const;

		JSArray GetPropertyName() const;
		bool HasProperty(const WebString& name) const;
		JSValue GetProperty(const WebString& name) const;
		void SetProperty(const WebString& name, const JSValue& value);
		void SetPropertyAsync(const WebString& name, const JSValue& value);
		void RemoveProperty(const WebString& name);
		JSArray GetMethodNames() const;
		bool HasMethod(const WebString& name) const;
		JSValue Invoke(const WebString& name, const JSArray& args);
		void InvokeAsync(const WebString& name, const JSArray& args);
		WebString ToString() const;


		void SetCustomMethod(const WebString& name, bool has_return_value);

		Error last_error() const;

		static JSObject* dummyjsobject;
		static JSArray* dummyjsarray;
		static JSValue* dummyjsvalue;
		static WebString* dummywebstring;
		static WebString* dummywebstring2;
		static WebView* dummyview;
	};

}