" File: pokemon.vim
" Author: Shinya Ohyanagi
" Original: Wataru MIYAGUNI <gonngo@gmail.com>
" Version: 0.1.0
" WebPage: http://github.com/heavenshell/vim-pokemon
" WebPage: https://github.com/gongo/pokemon-emacs
" Description: Vim script 
" License: MIT License, see LICENSE for more details.
let s:save_cpo = &cpo
set cpo&vim

let s:monsters = [
\  'Fushigidane',  'Fushigisou',  'Fushigiban',
\  'Hitokage',     'Lizardo',     'Lizardon',
\  'Zenigame',     'Kameil' ,     'Kamex',
\  'Caterpie',     'Transel',     'Butterfree',
\  'Beedle',       'Cocoon',      'Spear',
\  'Poppo',        'Pigeon',      'Pigeot',
\  'Koratt',       'Ratt',
\  'Onisuzume',    'Onidrill',
\  'Arbo',         'Arbok',
\  'Pikachu',      'Raichu',
\  'Sand',         'Sandpan',
\  'Nidoran♀',    'Nidorin',     'Nidoqueen',
\  'Nidoran♂',    'Nidorino',    'Nidoking',
\  'Pippi',        'Pixy',
\  'Rokon',        'Kyukon',
\  'Purin',        'Pukurin',
\  'Zubat',        'Golbat',
\  'Nazonokus',    'Kusaihan',    'Ruffresia',
\  'Paras',        'Parasect',
\  'Kongpang',     'Morphon',
\  'Digd',         'Dugtrio',
\  'Nyarth',       'Persian',
\  'Koduck',       'Golduck',
\  'Mankey',       'Okorizaru',
\  'Gardie',       'Windie',
\  'Nyoromo',      'Nyorozo',     'Nyorobon',
\  'Casey',        'Yungerer',    'Foodin',
\  'Wanriky',      'Goriky',      'Kairiky',
\  'Madatsubomi',  'Utsudon',     'Utsubot',
\  'Menokurage',   'Dokukurage',
\  'Ishitsubute',  'Golone',      'Golony',
\  'Ponyt',        'Gallop',
\  'Yadon',        'Yadoran',
\  'Coil',         'Rarecoil',
\  'Kamonegi',
\  'Dodo',         'Dodrio',
\  'Pawou',        'Jugon',
\  'Betbeter',     'Betbeton',
\  'Shellder',     'Parshen',
\  'Ghos',         'Ghost',       'Gangar',
\  'Iwark',
\  'Sleep',        'Sleeper',
\  'Crab',         'Kingler',
\  'Biriridama',   'Marumine',
\  'Tamatama',     'Nassy',
\  'Karakara',     'Garagar',
\  'Sawamular',
\  'Ebiwalar',
\  'Beroring',
\  'Dogars',       'Matadogas',
\  'Sihorn',       'Sidon',
\  'Lucky',
\  'Monjar',
\  'Garur',
\  'Tattu',        'Seadr',
\  'Tosakinto',    'Azumao',
\  'Hitodeman',    'Starmie',
\  'Barrierd',
\  'Strike',       'Rougel',
\  'Eleboo',       'Boober',
\  'Kailios',
\  'Kentauros',
\  'Koiking',      'Gyarados',
\  'Laplace',
\  'Metamon',
\  'Eievui',       'Showers',     'Thunders', 'Booster',
\  'Polygon',
\  'Omnite',       'Omstar',
\  'Kabuto',       'Kabutops',
\  'Pter',
\  'Kabigon',
\  'Freezer',
\  'Thunder',
\  'Fire',
\  'Miniryu',      'Hakuryu',     'Kairyu',
\  'Mewtwo',
\  'Mew',
\  'Mattn'
\ ]

function! s:seed(filename)
  return '0x' . sha256(a:filename)[:7] + 0
endfunction

function! pokemon#get(filename)
  let index = s:seed(a:filename) % len(s:monsters)
  return s:monsters[index]
endfunction

function! pokemon#getdaze()
  let name = expand('%:p')
  if name == ''
    let name = bufname(bufnr('%'))
  endif
  return pokemon#get(name)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
