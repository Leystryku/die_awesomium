#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "../jsarray.h"
#include "../jsvalue.h"
#include "../webview.h"
#include "../webstring.h"
#include "../jsobject.h"

namespace Awesomium
{
	JSObject* JSObject::dummyjsobject = new JSObject;
	JSArray* JSObject::dummyjsarray = new JSArray;
	JSValue* JSObject::dummyjsvalue = new JSValue;
	WebString* JSObject::dummywebstring = new WebString;
	WebString* JSObject::dummywebstring2 = new WebString;
	WebView* JSObject::dummyview = new WebView;

	/*
	JSObject::JSObject()
	{
	};

	JSObject::JSObject(const JSObject& obj)
	{
	};
	*/
	JSObject& JSObject::operator=(const JSObject& rhs)
	{
		return *dummyjsobject;
	};

	unsigned int JSObject::remote_id() const
	{
		return 0;
	};

	int JSObject::ref_count() const
	{
		return 0;
	};


	JSObjectType JSObject::type() const
	{
		return JSObjectType::kJSObjectType_Local;
	};

	WebView* JSObject::owner() const
	{
		return dummyview;
	};

	JSArray JSObject::GetPropertyName() const
	{
		return *dummyjsarray;
	};

	bool JSObject::HasProperty(const WebString& name) const
	{
		return false;
	}

	JSValue JSObject::GetProperty(const WebString& name) const
	{
		return *dummyjsvalue;
	};

	void JSObject::SetProperty(const WebString& name, const JSValue& value)
	{
	};

	void JSObject::SetPropertyAsync(const WebString& name, const JSValue& value)
	{
	};

	void JSObject::RemoveProperty(const WebString& name)
	{
	};

	JSArray JSObject::GetMethodNames() const
	{
		return *dummyjsarray;
	};

	bool JSObject::HasMethod(const WebString& name) const
	{
		return false;
	};

	JSValue JSObject::Invoke(const WebString& name, const JSArray& args)
	{
		return *dummyjsvalue;
	};

	void JSObject::InvokeAsync(const WebString& name, const JSArray& args)
	{
	};

	WebString JSObject::ToString() const
	{
		return *dummywebstring2;
	};


	void JSObject::SetCustomMethod(const WebString& name, bool has_return_value)
	{
	};

	Error JSObject::last_error() const
	{
		return kError_None;
	};

}