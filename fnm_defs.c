#include <fnmatch.h>

enum FNMOptions
{
	noMatch = FNM_NOMATCH,
	pathName = FNM_PATHNAME,
	period = FNM_PERIOD,
	leadingDir = FNM_LEADING_DIR,
	caseFold = FNM_CASEFOLD,
	extMatch = FNM_EXTMATCH
};
