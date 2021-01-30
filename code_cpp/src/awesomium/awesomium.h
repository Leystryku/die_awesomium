#pragma once

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
}