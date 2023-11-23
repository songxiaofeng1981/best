(function(html) {
const id = document.currentScript.getAttribute('data-photo-id');
const url = document.currentScript.getAttribute('data-photo-url');
const target = document.currentScript.getAttribute('data-target-id');
const container = document.querySelector(`#${target}`);
container.innerHTML = html;
openPhoto("id-"+id, url);
lazyload();
})(`
<li class="item " id="id-image00421" style="background-image: url('/best/photos/tint/Image00421-65ba1d.webp')" title="Image00421">
  <img class="lazyload" data-src="/best/photos/thumbnail/Image00421-ccf4df.webp" src="/best/photos/tint/Image00421-65ba1d.webp" height="" width="" />
  <span class="full">
    <span style="background-image: url('/best/photos/large/Image00421-686656.webp')"></span>
  </span>
  <a class="open" href="/best/image00421" data-target="id-image00421">Open</a>
  <a class="close" href="/best/">Close</a>
  <a href="/best/001" data-target="id-001" class="next" title="Go to next photo">
    <span>Next</span>
  </a>
  <ul class="links top photodetail-links">
    <li class="share"><a onClick="shareImage('Image00421','/best/image00421');" title="Share this photo">Share</a></li>
  </ul>
  <ul class="meta">
    <!--
        <li></li>
        <li></li>
        <li><span class="aperture"><em>f</em>/</span></li>
        -->
    <li><a onClick="shareImage('Image00421', '/best/image00421')" class="gridview-button share" title="Share this image">Share</a></li>
  </ul>
</li>
<li class="item " id="id-001" style="background-image: url('/best/photos/tint/001-65ba1d.jpg')" title="001">
  <img class="lazyload" data-src="/best/photos/thumbnail/001-ccf4df.jpg" src="/best/photos/tint/001-65ba1d.jpg" height="" width="" />
  <span class="full">
    <span style="background-image: url('/best/photos/large/001-686656.jpg')"></span>
  </span>
  <a class="open" href="/best/001" data-target="id-001">Open</a>
  <a class="close" href="/best/">Close</a>
  <a href="/best/image00421" data-target="id-image00421" class="previous" title="Go to previous photo">
    <span>Previous</span>
  </a>
  <ul class="links top photodetail-links">
    <li class="share"><a onClick="shareImage('001','/best/001');" title="Share this photo">Share</a></li>
  </ul>
  <ul class="meta">
    <!--
        <li></li>
        <li></li>
        <li><span class="aperture"><em>f</em>/</span></li>
        -->
    <li><a onClick="shareImage('001', '/best/001')" class="gridview-button share" title="Share this image">Share</a></li>
  </ul>
</li>
`);