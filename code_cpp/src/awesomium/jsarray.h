#pragma once

#ifndef DllExport
#define DllExport   __declspec( dllexport )
#endif

namespace Awesomium
{

	class JSValue;
	template<class T>
	class WebVector;


	class DllExport JSArray
	{
	public:
		explicit JSArray();
		JSArray(unsigned int n);
		JSArray(const JSArray& rhs);
		JSArray& operator=(const JSArray& rhs);

		unsigned int size() const;
		unsigned int capacity() const;
		JSValue& At(unsigned int idx);
		const JSValue& At(unsigned int idx) const;

		JSValue& operator[](unsigned int idx);

		const JSValue& operator[](unsigned int idx) const;

		void Push(const JSValue& item);
		void Pop();
		void Insert(const JSValue& item, unsigned int idx);
		void Erase(unsigned int idx);
		void Clear();

		static JSArray* dummyjsarray;
		static JSValue* dummyjsvalue;

	protected:
		WebVector<JSValue>* vector_;
	};
};