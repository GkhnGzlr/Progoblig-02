use context essentials2021
## Disse linjene inkluderer moduler for bildebehandling og fargebehandling i Pyret.

include image
include color

## Her har jeg definert en funksjon kalt tegnflagg som tar parameteren land.

fun tegnflag(land):
  
  ## Hvis landparameteren er lik "spesifisert land", tegnes flagget til det spesifiserte landet ved hjelp av rektangler i forskjellige farger og størrelser. rectangle(width, height, style, color)-funksjonen oppretter et rektangel med spesifisert bredde, høyde, stil og farge. overlay-align og overlay-xy brukes til å justere og plassere rektanglene riktig.
    
  if land == "Finland":
    block:

      finFlagg-blue = rectangle(180, 110, "solid", "white")
finFlagg-horizantal = rectangle(180, 30, "solid", "dark-blue")
finFlagg-vertical = rectangle(30, 110, "solid", "dark-blue")

finFlagg-white = (overlay-align("middle","center", finFlagg-horizantal, finFlagg-blue))
overlay-xy(finFlagg-vertical, -50, -0, finFlagg-white)
end
  
  else if land == "Danmark":
    block:
      
      DanFlagg-red = rectangle(370, 280, "solid", "red")
DanFlagg-horizantal = rectangle(370, 40, "solid", "white")
DanFlagg-vertical = rectangle(40, 280, "solid", "white")

DanFlagg-white = (overlay-align("middle","center", DanFlagg-horizantal, DanFlagg-red))
overlay-xy(DanFlagg-vertical, -120, -0, DanFlagg-white)
end
    
  else if land == "Sverige":
    block:

sveFlagg-blue = rectangle(160, 100, "solid", "dark-blue")
sveFlagg-horizantal = rectangle(160, 20, "solid", "yellow")
sveFlagg-vertical = rectangle(20, 100, "solid", "yellow")

sveFlagg-yellow = (overlay-align("middle","center", sveFlagg-horizantal, sveFlagg-blue))
overlay-xy(sveFlagg-vertical, -50, -0, sveFlagg-yellow)
 end
    
    
  else if land == "Island":
    block:

isFlagg-blue = rectangle(250, 180, "solid", "darkBlue")
isHorizontalLine-white = rectangle(250, 40, "solid", "white")
isVerticalLine-white = rectangle(40, 180, "solid", "white")
      isHorizontalLine-red = rectangle(250, 20, "solid", "red")
      isVerticalLine-red = rectangle(20, 180, "solid", "red")
          
          
          
      isFlagg-line-background = overlay-align("middle", "center", isHorizontalLine-white, isFlagg-blue)
isWhite-lines = overlay-xy(isVerticalLine-white, -70, 0, isFlagg-line-background)

      isRedLine-in-flagg = overlay-align("middle", "center",isHorizontalLine-red, isWhite-lines)
      overlay-xy(isVerticalLine-red, -80, 0, isRedLine-in-flagg)
 end
    
    
  else if land == "Norge":
    block:
      
Norgesflagg-red = rectangle(220, 160, "solid", "red")
Norgesflagg-horizontalline-white = rectangle(220, 40, "solid", "white")
Norgesflagg-verticalline-white = rectangle(40, 160, "solid", "white")
Norgesflagg-horizontalline-blue = rectangle(220, 20, "solid", "darkblue")
Norgesflagg-verticalline-blue = rectangle(20, 160, "solid", "darkblue")
          
          
flagg-line-background = overlay-align("middle", "center", Norgesflagg-horizontalline-white, Norgesflagg-red)
      
Norgesflagg-white-lines = overlay-xy(Norgesflagg-verticalline-white, -60, 0, flagg-line-background)
          
Norgesflagg-blueline-in-flagg = overlay-align("middle", "center",Norgesflagg-horizontalline-blue, Norgesflagg-white-lines)
      
overlay-xy(Norgesflagg-verticalline-blue, -70, 0, Norgesflagg-blueline-in-flagg)
end
  
    ## Hvis parameteren land ikke matcher noen av de nordiske landene, returnerer funksjonen strengen "ingen flagg".
     
  else:
    "ingen flagg"
end
end

## For å tegne flagget til det valgte landet kalles funksjonen med parameteren "Navn på det valgte landet".

tegnflag("Norge")
