#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

#include "jsarray.h"
#include "webstring.h"

namespace Awesomium
{
	class WebView;
	class JSValue;
	class JSObject;

	class DllExport JSValue
	{
	public:
		JSValue() {};
		explicit JSValue(bool val);
		explicit JSValue(int val);
		explicit JSValue(double val);
		JSValue(const WebString& val);
		JSValue(const JSObject& val);
		JSValue(const JSArray& val);
		JSValue(const JSValue& orig);

		~JSValue();

		JSValue& operator=(const JSValue& rhs);

		static const JSValue& Undefined();
		static const JSValue& Null();

		bool IsBoolean() const;
		bool IsInteger() const;
		bool IsDouble() const;
		bool IsNumber() const;
		bool IsString() const;
		bool IsArray() const;
		bool IsObject() const;
		bool IsNull() const;
		bool IsUndefined() const;

		WebString ToString() const;
		int ToInteger() const;
		double ToDouble() const;
		bool ToBoolean() const;
		JSArray& ToArray();
		const JSArray& ToArray() const;

		JSObject& ToObject();
		const JSObject& ToObject() const;

		static JSValue* dummyjsvalue1;
		static JSValue* dummyjsvalue2;
		static JSValue* dummyjsvalue3;
		static JSObject* dummyjsobject;
		static JSArray* dummyjsarray;
		static WebString* dummywebstring;

	};

}