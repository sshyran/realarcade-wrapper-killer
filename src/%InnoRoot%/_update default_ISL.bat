if exist "C:\Program Files\Inno Setup 5\Default.isl" (
del "C:\Program Files\Inno Setup 5\Default.isl"
copy /y "Default.isl" "C:\Program Files\Inno Setup 5"
copy /y "Default.isl" "%cd%\Inno Setup 5"
copy /y "WizModernImage.bmp" "C:\Program Files\Inno Setup 5"
copy /y "WizModernSmallImage.bmp" "C:\Program Files\Inno Setup 5"

)