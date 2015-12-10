<test>
  <h1>hoge</h1>
</test>

<fuck>
  <h2>fuck</h2>
</fuck>

<essays>
  <essayList name={"article"} essays={articles} link={"essays/pickup"}></essayList>
  <essayList name={"post"} essays={posts} link={"essays"}></essayList>
  <essaylist name={"question"} essays={questions} link={"essays/question"}></essaylist>
  <script>
   this.posts = opts.posts;
   this.articles = opts.articles;
   this.questions = opts.questions;
  </script>
</essays>

<essaylist>
  <ul class="collection with-header">
    <li class="collection-header"><h4 id={name+"-header"}>{name}</h4></li>
    <li each={essay in essays} class="collection-item">
      <essay essay={essay}></essay>
    <li class="collection-item" id={name} name={link}> more...
  </ul>
  <script>
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
  </script>
</essaylist>

<essay>
  <p onclick={ () => document.location.pathname = "essays/"+essay.id }>title: {essay.title}<br/>text: {essay.text.split(0, 100)}</p>
  <script>
    this.essay = opts.essay;
    this.on("mount", () => {
      document.getElementById("essay");
    })
  </script>
</essay>

<myheader>
  <nav>
  <div class="nav-wrapper">
    <a href="" class="brand-logo">Yamapro</a>
    <ul id="nav-mobile" class="right hide-on-med-and-down">
      <li>
        <a href="javascript:void(0)" 
        onclick={ () => {
          document.getElementById("article-header").scrollIntoView(true);
        }}>
          article
        </a>
      </li>
      <li>
        <a href="javascript:void(0)" onclick={ () => {
          document.getElementById("post-header").scrollIntoView(true);
        }}>user posts</a>
      </li>
      <li>
        <a href="javascript:void(0)" onclick={ () => {
          document.getElementById("question-header").scrollIntoView(true);
        }}>questions</a>
      </li>
    </ul>
  </div>
</nav>
</myheader>