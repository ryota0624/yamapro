riot.tag2('test', '<h1>hoge</h1>', '', '', function(opts) {
});

riot.tag2('fuck', '<h2>fuck</h2>', '', '', function(opts) {
});

riot.tag2('essays', '<essaylist name="{&quot;article&quot;}" essays="{articles}" link="{&quot;essays/pickup&quot;}"></essayList> <essaylist name="{&quot;post&quot;}" essays="{posts}" link="{&quot;essays&quot;}"></essayList> <essaylist name="{&quot;question&quot;}" essays="{questions}" link="{&quot;essays/question&quot;}"></essaylist>', '', '', function(opts) {
   this.posts = opts.posts;
   this.articles = opts.articles;
   this.questions = opts.questions;
}, '{ }');

riot.tag2('essaylist', '<ul class="collection with-header"> <li class="collection-header"><h4 id="{name+&quot;-header&quot;}">{name}</h4></li> <li each="{essay in essays}" class="collection-item"> <essay essay="{essay}"></essay> <li class="collection-item" id="{name}" name="{link}"> more... </ul>', '', '', function(opts) {
    this.link = opts.link;
    this.essays = opts.essays;
    this.name = opts.name;
    function jumpPage(ev) {
      document.location.pathname = ev.target.getAttribute("name");
    }
    this.on("mount", () => {
      var moreLink = document.getElementById(this.name);
      moreLink.onclick = jumpPage
    })
}, '{ }');

riot.tag2('essay', '<p onclick="{() => document.location.pathname = &quot;essays/&quot;+essay.id}">title: {essay.title}<br>text: {essay.text.split(0, 100)}</p>', '', '', function(opts) {
    this.essay = opts.essay;
    this.on("mount", () => {
      document.getElementById("essay");
    })
}, '{ }');

riot.tag2('myheader', '<nav> <div class="nav-wrapper"> <a href="" class="brand-logo">Yamapro</a> <ul id="nav-mobile" class="right hide-on-med-and-down"> <li> <a href="javascript:void(0)" onclick="{() => {           document.getElementById(&quot;article-header&quot;).scrollIntoView(true);         }}"> article </a> </li> <li> <a href="javascript:void(0)" onclick="{() => {           document.getElementById(&quot;post-header&quot;).scrollIntoView(true);         }}">user posts</a> </li> <li> <a href="javascript:void(0)" onclick="{() => {           document.getElementById(&quot;question-header&quot;).scrollIntoView(true);         }}">questions</a> </li> </ul> </div> </nav>', '', '', function(opts) {
}, '{ }');