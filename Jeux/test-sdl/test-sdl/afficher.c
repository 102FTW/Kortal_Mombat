#include "SDL.h" 


 
int main(int argc, char **argv) 
{ 
     xSDL_Surface *screen;    // Surface representant le contenu de la fenetre
     xSDL_Surface *bmp;       // Surface representant l'image
     xSDL_Rect    targetarea; // Coordonnees de l'image dans la fenetre
      
     /* Initialiser la librairie */ 
     xSDL_Init(SDL_INIT_VIDEO); 
     /* Charger l'image test.bmp dans un SDL_Surface */ 
     xbmp = SDL_LoadBMP("test.bmp"); 

     /* Initialiser la fenetre */ 
     xscreen = SDL_SetVideoMode(bmp->w, bmp->h, 32, SDL_SWSURFACE); 
     
      
     /* Coordonnees de l'image dans la fenetre */ 
     xtargetarea.x = 0;
     xtargetarea.y = 0;
     xtargetarea.w = bmp->w; 
     xtargetarea.h = bmp->h; 
      
     /* Place l'image sur la fenetre */ 
     xSDL_BlitSurface(bmp, NULL, screen, &targetarea); 

     /* Met la fenetre a jour (double buffer) */ 
     xSDL_Flip(screen); 
 
     /* Attend avant de terminer l'application */ 
     xSDL_Delay(2000); 
     
     return 0; 
}
