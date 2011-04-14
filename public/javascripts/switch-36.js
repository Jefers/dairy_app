// display a per-browser image.
// @param p - target <p> which holds the <img> tags
// @param c - <img> class name to show
function display(p, c){
    var t = p.getElementsByTagName('a');
    for (var i = 0; i<t.length; i++) {
  if(c == t[i].className)
            t[i].style.display = 'inline';
        else
            t[i].style.display = 'none';
    }
}

// detect the user's browser type,
// then look for UTW buttons and show the appropriate one
function init_utw() {
    BrowserDetect.init();

    if (typeof document.getElementsByClassName != 'undefined')
        var p = document.getElementsByClassName('sfx-affiliates-utw-button');
    else
        var p = utw_getElementsByClass('sfx-affiliates-utw-button', document, 'span');

    for (var i = 0; i < p.length; i++) {

        // Start writing JavaScript here
        if (BrowserDetect.browser == "Firefox"){
            if (BrowserDetect.version == "3.6")
                display(p[i], 'ff36');
            else
                display(p[i], 'ff');
        }
        else if (BrowserDetect.browser == "Explorer") {
            display(p[i], 'ie');
        }
        else {
            display(p[i], 'other');
        }
    }
};

/* *********************************************
This code came from http://www.quirksmode.org/js/detect.html
In order for this to function properly, it must be updated regularly
***********************************************/

var BrowserDetect = {
  init: function () {
    this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
    this.version = this.searchVersion(navigator.userAgent)
      || this.searchVersion(navigator.appVersion)
      || "an unknown version";
    this.OS = this.searchString(this.dataOS) || "an unknown OS";
  },
  searchString: function (data) {
    for (var i=0;i<data.length;i++) {
      var dataString = data[i].string;
      var dataProp = data[i].prop;
      this.versionSearchString = data[i].versionSearch || data[i].identity;
      if (dataString) {
        if (dataString.indexOf(data[i].subString) != -1)
          return data[i].identity;
      }
      else if (dataProp)
        return data[i].identity;
    }
  },
  searchVersion: function (dataString) {
    var index = dataString.indexOf(this.versionSearchString);
    if (index == -1) return;
    return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
  },
  dataBrowser: [
    {   string: navigator.userAgent,
      subString: "OmniWeb",
      versionSearch: "OmniWeb/",
      identity: "OmniWeb"
    },
    {
      string: navigator.vendor,
      subString: "Apple",
      identity: "Safari"
    },
    {
      prop: window.opera,
      identity: "Opera"
    },
    {
      string: navigator.vendor,
      subString: "iCab",
      identity: "iCab"
    },
    {
      string: navigator.vendor,
      subString: "KDE",
      identity: "Konqueror"
    },
    {
      string: navigator.userAgent,
      subString: "Firefox",
      identity: "Firefox"
    },
    {
      string: navigator.vendor,
      subString: "Camino",
      identity: "Camino"
    },
    {   // for newer Netscapes (6+)
      string: navigator.userAgent,
      subString: "Netscape",
      identity: "Netscape"
    },
    {
      string: navigator.userAgent,
      subString: "MSIE",
      identity: "Explorer",
      versionSearch: "MSIE"
    },
    {
      string: navigator.userAgent,
      subString: "Gecko",
      identity: "Mozilla",
      versionSearch: "rv"
    },
    {     // for older Netscapes (4-)
      string: navigator.userAgent,
      subString: "Mozilla",
      identity: "Netscape",
      versionSearch: "Mozilla"
    }
  ],
  dataOS : [
    {
      string: navigator.platform,
      subString: "Win",
      identity: "Windows"
    },
    {
      string: navigator.platform,
      subString: "Mac",
      identity: "Mac"
    },
    {
      string: navigator.platform,
      subString: "Linux",
      identity: "Linux"
    }
  ]

};


function utw_getElementsByClass(searchClass,node,tag) {
        var classElements = new Array();
        if ( node == null )
                node = document;
        if ( tag == null )
                tag = '*';
        var els = node.getElementsByTagName(tag);
        var elsLen = els.length;
        var pattern = new RegExp("(^|\\s)"+searchClass+"(\\s|$)");
        for (i = 0, j = 0; i < elsLen; i++) {
                if ( pattern.test(els[i].className) ) {
                        classElements[j] = els[i];
                        j++;
                }
        }
        return classElements;
}

