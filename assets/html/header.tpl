<!-- Header -->
<header>
  <div class="bg-primary text-white text-center mb-0">
    <div id="carouselDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
       {foreach $carousel as $value}{if $value@first}
       <button type="button" data-bs-target="#carouselDark" data-bs-slide-to="{$value@iteration -1}" class="active" aria-current="true" aria-label="Slide {$value@iteration -1}"></button> 
        {else}<button type="button" data-bs-target="#carouselDark" data-bs-slide-to="{$value@iteration -1}" aria-current="true" aria-label="Slide {$value@iteration -1}"></button>{/if}{/foreach} 
      </div>
      <div class="carousel-inner"> 
       {foreach $carousel as $value}{if $value@first}<div class="carousel-item active" data-bs-interval="5000">
          <img class="d-block w-100" src="{$value.IMG_SRC}" alt="{$value.IMG_ALT}">
          <div class="carousel-caption d-none d-md-block">
            <h5 class="fs-2 text-white fw-bold">{$value.IMG_ALT}</h5>
            <p class="fs-5 text-white">{$value.DESCRIPTION}</p>
          </div>
        </div>         
        {else}<div class="carousel-item" data-bs-interval="5000">
          <img class="d-block w-100" src="{$value.IMG_SRC}" alt="{$value.IMG_ALT}">
          <div class="carousel-caption d-none d-md-block">
            <h5 class="fs-2 text-white fw-bold">{$value.IMG_ALT}</h5>
            <p class="fs-5 text-white">{$value.DESCRIPTION}</p>
          </div>
        </div>{/if}{/foreach} 
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselDark" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">{$PREVIOUS}</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselDark" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">{$NEXT}</span>
      </button>
    </div>
  </div>
</header>

