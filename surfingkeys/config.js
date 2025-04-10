// Normal Mode
api.map("H", "S"); // Go Back one Page
api.map("J", "R"); // Switch to Previous Tab
api.map("K", "E"); // Switch to Next Tab
api.map("L", "D"); // Go Forward one Page

api.map("<Ctrl-Esc>", "<Esc>"); // Esc
api.map(";la", ";ql"); // View Last Command

api.map("D", "P"); // Scroll one Full Page
api.map("F", "af"); // Open Link in new Tab

api.map("a", "i"); // Go to Edit Box
api.map("A", "I"); // Go to Edit Box with Vim Editor Mode

api.map(";M", "<Ctrl-h>"); // Mouse Out Element ?
api.map("^", "0"); // Scroll full left

api.map("gxj", "gxT"); // Close Previous Tab
api.map("gxk", "gxt"); // Close Next Tab

api.map(";tu", ";u");
api.map(";u", ";U"); // Edit Url and Open in Current Tab
api.map(";U", ";tu"); // Edit Url and Open in New Tab

api.map("<Alt-f>", "cf"); // Open Multiple Link's in New Tab
api.map("<Alt-t>", "<Alt-s>"); // Toggle Surfing Keys on current Tab
api.map("<Alt-p>", "<Alt-i>"); // Enter Pass Through Mode

api.map("g^", "g0"); // Goto first tab
api.map("gx^", "gx0"); // Close all tabs before current

api.unmap("e");
api.unmap("P");
api.unmap("R");
api.unmap("E");
api.unmap("<Alt-s>");
api.unmap("<Alt-i>");
api.unmap("0");
api.unmap("g0");
api.unmap("gx0");
api.unmap("af");
api.unmap("cf");
api.unmap("C");
api.unmap("S");
api.unmap("B");
api.unmap(";tu");
api.unmap("O");
api.unmap("<Ctrl-j>");

// Insert Mode
api.imap("<Ctrl-;>", "<Esc>"); // Esc
api.imap("<Alt-h>", "<Alt-b>"); // Move one Word backward in Insert Mode
api.imap("<Alt-l>", "<Alt-f>"); // Move one Word forward in Insert Mode
api.imap("<Ctrl-6>", "<Ctrl-f>"); // Move to Start of Input Text
api.imap("<Ctrl-4>", "<Ctrl-e>"); // Move to End of Input Text

api.iunmap("<Esc>");
api.iunmap("<Alt-b>");
api.iunmap("<Alt-f>");
api.iunmap("<Alt-w>");
api.iunmap("<Alt-d>");
api.iunmap("<Ctrl-f>");
api.iunmap("<Ctrl-e>");

// Visual Mode
api.vmap("^", "0"); // Goto start of sentence

api.vunmap("<Esc>");
api.vunmap("0");

// Omibar Mode
api.cmap("<Ctrl-Esc>", "Esc"); // Esc

// Lurk Mode
api.lmap("<Alt-p>", "<Alt-i>"); // Enter Normal Mode

api.unmap("<Esc>");
api.unmap("<Alt-i>");

// Search Alias
api.removeSearchAlias("b");
api.removeSearchAlias("e");

api.addSearchAlias(
  "b",
  "Brave",
  "https://search.brave.com/search?q=",
  "s",
  "https://search.brave.com/api/suggest?q=",
  function (response) {
    return JSON.parse(response.text);
  },
  "o",
  {
    favicon_url: "https://search.brave.com/favicon.ico",
  },
);

api.addSearchAlias(
  "i",
  "Bing",
  "https://www.bing.com/search?q=",
  "s",
  "https://api.bing.com/osjson.aspx?query=",
  function (response) {
    var suggestions = JSON.parse(response.text);
    return suggestions[1];
  },
  "o",
  {
    favicon_url: "https://www.bing.com/favicon.ico",
  },
);

api.addSearchAlias(
  "w",
  "Wikipedia",
  "https://en.wikipedia.org/wiki/Special:Search?search=",
  "s",
  "https://en.wikipedia.org/w/api.php?action=opensearch&format=json&search=",
  function (response) {
    var suggestions = JSON.parse(response.text);
    return suggestions[1];
  },
  "o",
  {
    favicon_url: "https://en.wikipedia.org/favicon.ico",
  },
);

settings.theme = "dark";
settings.focusOnSaved = false;
settings.focusFirstCandidate = true;
settings.modeAfterYank = "Normal";
settings.hintShiftNonActive = true;
settings.tabsMRUOrder = true;
settings.smoothScroll = true;
settings.hintAlign = "center";
settings.scrollStepSize = 100;
settings.showModeStatus = true;
settings.defaultSearchEngine = "b";
settings.lurkingPattern =
  /https:\/\/github\.com|https:\/\/www\.boot\.dev|.*confluence.*/i;
// settings.blocklistPattern = "";

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 10pt;
    background: #24272e;
    color: #abb2bf;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #61afef;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: #528bff;
}
.sk_theme .omnibar_timestamp {
    color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
    color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 20pt;
}`;
