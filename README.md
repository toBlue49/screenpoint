# **ScreenPoint**
ScreenPoint ist ein *Bildschirmschoner*, welcher dein *Bildschirm schont*. (also hoffentlich)  

**Hauptbildschirm:**  

![readme_img1](https://github.com/toBlue49/screenpoint/blob/main/Assets/readme_img/main.png "Readme Main Screen")  

**Einstellungen:**  
![readme_img2](https://github.com/toBlue49/screenpoint/blob/main/Assets/readme_img/settings.png "Readme Settings Screen")  

**Datei geladen:**  
![readme_img3](https://github.com/toBlue49/screenpoint/blob/main/Assets/readme_img/fild_loaded.png "Readme File Loaded Screen")  

# **ScreenPoint Lines Tutorial**
Version: **0.6.0**  
Date: **29.07.2025**; Time: **13:09**

## Basisinformationen
Um die Datei zu laden muss "J" drückt werden und dannach eine Datei geladen werden. ScreenPoint zeigt dann alle Strings (Text) von der Text Datei.
Die Strings werden in einem *Array angegeben*. Diese gibts du so an: `["HIER DEIN TEXT", "HIER DEIN 2. TEXT"]`

**WARNUNG:** Vergesse nicht das *Komma nach den Strings* (Text), welche du in *Anführungsstichen* umrandest. Gebe *kein Komma* nach dem *letztem String*, wie bei einer Aufzählung.

## Kommentare
Um eine Zeile *auszukommentieren* muss in diesem String *"###"* vorhanden sein. Es ist egal wo *"###"* vorkommt, aber es ist empfohlen die *drei Hashtags* am Anfang des Strings zu platzieren.

**BEISPIEL:**
- `"\#\#\# Das hier ist ein Kommentar"`
- `"Das hier ist auch ein Kommentar \#\#\#"`
- `"\#\#\#\# Sehr toller Kommentar"`
- `"Das hier ist KEIN Kommentar \#\# \#"`

## Zeilenumbruch
Um einen *Zeilenumbruch* in einem String zu erstellen *ohne die Entertaste* zu verwenden. Muss an dieser Stelle ein *"\\n"* eingefügt werden. *(kein "/n")*. Nach dem *Zeilenumbruch* *kein Leerzeichen* verwenden, dann wird der Text *nicht mittig*. (So wie wenn du Enter drückst. Dannach kommt auch *kein Leerzeichen*)

**BEISPIEL:**
- Jetzt kommt ein Zeilenumbruch hier:/nWirklich crazy
    - `"Jetzt kommt ein Zeilenumbruch hier:`  
    `Wirklich crazy"`
- Leerzeichen nicht /n so wild young.
	- `"Leerzeichen nicht  `  
    `  so wild young."`

**Viel Spaß mit ScreenPoint!**

# Build
**Godot Version:** 4.4.1

Das Projekt in der Godot Engine importieren und dannach bearbeiten oder kompelieren.
