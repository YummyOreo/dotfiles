#!/bin/bash


cp ~/.config/hypr/active/wallpaper.jpg ~/.config/hypr/inactive/wallpaper.jpg.tmp
cp ~/.config/hypr/inactive/wallpaper.jpg ~/.config/hypr/active/wallpaper.jpg
mv ~/.config/hypr/inactive/wallpaper.jpg.tmp ~/.config/hypr/inactive/wallpaper.jpg
swaybg -m fill -i ~/.config/hypr/active/wallpaper.jpg
