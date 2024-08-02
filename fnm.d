import std.getopt;
import std.string;

extern (C) int fnmatch(const char * pattern, const char * str, int flags);

import fnm_defs;

auto main(string[] args)
{
	string pattern;
	string str;

	bool noEscape = false;
	bool pathName = false;
	bool period = false;
	bool leadingDir = false;
	bool caseFold = false;
	bool extMatch = false;

	auto opts = getopt(
		args,
		config.required, "pattern|p", &pattern,
		config.required, "string|s", &str,
		"no-escape|n", &noEscape,
		"pathname|f", &pathName,
		"period|d", &pathName,
		"leading-dir|l", &leadingDir,
		"case-fold|i", &caseFold,
		"ext-match|e", &extMatch,
	);
	if (opts.helpWanted) {
		defaultGetoptPrinter("fnm (fnmatch)", opts.options);
		return 2;
	}

	int flags = 0;
	if (noEscape) {
		flags |= FNMOptions.noMatch;
	}

	if (pathName) {
		flags |= FNMOptions.pathName;
	}

	if (period) {
		flags |= FNMOptions.period;
	}

	if (leadingDir) {
		flags |= FNMOptions.leadingDir;
	}

	if (caseFold) {
		flags |= FNMOptions.caseFold;
	}

	if (extMatch) {
		flags |= FNMOptions.extMatch;
	}

	return fnmatch(toStringz(pattern), toStringz(str), flags);
}
