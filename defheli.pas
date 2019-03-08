program helico;
{$UNITPATH \SDL2}

uses  SDL2, SDL2_image;

var
//Helico

sdlTexture2: PSDL_Texture;
sdlRectangle2: TSDL_Rect;
fin :BOOLEAN ;
I,j : INTEGER;



//rider
sdlSurface1: PSDL_Surface;
sdlTexture1: PSDL_Texture;
sdlWindow1: PSDL_Window;
sdlRenderer: PSDL_Renderer;
sdlRectangle: TSDL_Rect;

BEGIN
// initialisation video des sous-systemes
if SDL_Init(SDL_INIT_VIDEO) < 0
 then HALT;

if SDL_CreateWindowAndRenderer (500,500,SDL_WINDOW_SHOWN, @sdlWindow1,@sdlRenderer)<> 0
 then HALT;

//réglage qualité échelle
 SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, 'nearest');

//image de l'hélico
sdlTexture2:= IMG_LoadTexture( sdlRenderer,'helicopter.png') ;

//if SDL_RenderCopy (sdlRenderer, sdlTexture2, nil , nil)<> 0 then halt;


//image importe du rider
sdlSurface1:= SDL_LoadBMP('rider.bmp');
if sdlSurface1= nil then Halt;

//chargement image dossier
sdlTexture1:= SDL_CreateTextureFromSurface(sdlRenderer, sdlSurface1);
if sdlTexture1= nil then Halt;


//if SDL_RenderCopy(sdlRenderer, sdlTexture1, nil, nil)<> 0 then
//Halt;

//preparation rectangulaire
sdlRectangle.x := 12;
sdlRectangle.y := 25;
sdlRectangle.h := 128;
sdlRectangle.w := 55;

//PREPARATION rectangle2

for i:=0 to 4 do
BEGIN
sdlRectangle2.x:=i*128;
sdlRectangle2.y:=0;
sdlRectangle2.w:=128;
sdlRectangle2.h:=55;
//i := i+1;
//if i>4 then i:=0;
SDL_RenderCopy(sdlRenderer, sdlTexture2, @sdlRectangle2, @sdlRectangle);
SDL_RenderPresent(sdlRenderer);
SDL_RenderClear(sdlRenderer);
END;



//texture
//SDL_RenderCopy(sdlRenderer, sdlTexture1, @sdlRectangle, nil);
//SDL_RenderCopy(sdlRenderer, sdlTexture1, nil, @sdlRectangle);



{
if SDL_CreateWindowAndRenderer(500, 500, SDL_WINDOW_SHOWN, @sdlWindow1, @sdlRenderer) <>
    then Halt;
    }
//SDL_RenderPresent(sdlRenderer);
SDL_Delay(4000);


SDL_DestroyTexture(sdlTexture2);

SDL_DestroyTexture(sdlTexture1);
SDL_FreeSurface(sdlSurface1);
SDL_DestroyRenderer(sdlRenderer);
SDL_DestroyWindow (sdlWindow1);

SDL_Quit;

end.


