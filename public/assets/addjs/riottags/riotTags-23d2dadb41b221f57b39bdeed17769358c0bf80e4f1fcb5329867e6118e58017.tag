<test>
  <h1>hoge</h1>
</test>

<fuck>
  <h2>fuck</h2>
</fuck>

<essays>
  <ul class="collection with-header">
    <li class="collection-header"><h4 id="article-header">Articles</h4></li>
    <li each={essay in articles} class="collection-item">
      <essay essay={essay}></essay>
    <li class="collection-item" id="article" name="essays/pickup"> more...
  </ul>
  <ul class="collection with-header">
    <li class="collection-header"><h4 id="post-header">Posts</h4></li>
    <li each={essay in posts} class="collection-item">
      <essay essay={essay}></essay>
    <li class="collection-item" id="post" name="essays"> more...
  </ul>
    <ul class="collection with-header">
    <li class="collection-header"><h4 id="question-header">Questions</h4></li>
    <li each={essay in questions} class="collection-item">
      <essay essay={essay}></essay>
    <li class="collection-item" id="question" name="essays/question"> more...
  </ul>
  <script>
   this.posts = opts.posts;
   this.articles = opts.articles;
   this.questions = opts.questions;
   this.on("mount",() => {
    var postLink = document.getElementById("post");
    var articleLink = document.getElementById("article");
    var questionLink = document.getElementById("question");
    postLink.onclick = jumpPage;
    articleLink.onclick = jumpPage;
    questionLink.onclick = jumpPage;
   })
   function jumpPage(ev) {
    document.location.pathname = ev.target.getAttribute("name");
   }
  </script>
</essays>

<essay>
  <p onclick={ () => document.location.pathname = "essays/"+essay.id }>{essay.title}</p>
  <script>
    this.essay = opts.essay;
    this.on("mount", () => {
      document.getElementById("essay")
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
          feature article
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