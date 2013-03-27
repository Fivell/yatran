Ruby unofficial client for Yandex translation engine


## Build status
[![Build Status](https://travis-ci.org/Fivell/yatran.png)](https://travis-ci.org/Fivell/yatran)

Examples


    1.9.2p320 :001 > require 'yatran'
    => true
    1.9.2p320 :002 > "Hello world".lang
    => "en"
    1.9.2p320 :003 > "Hello world".language
    => "en"
    1.9.2p320 :004 > "Hello world".en_ru
    => "Привет, мир!"
    1.9.2p320 :005 > "Hello world".en_ru.ru_fr
    => "Bonjour tout le monde!"
    1.9.2p320 :006 > "Hello world".en_ru.ru_it
    => "Ciao, mondo!"
    1.9.2p320 :009 > "Hello world".respond_to?("en_ru")
    => true
    1.9.2p320 :010 > "Hello world".respond_to?("from_en_to_ru")
    => true
    1.9.2p320 :011 > "Hello world".respond_to?("to_ru_from_en")
    => true

Detect with language method

    1.9.2p320 :007 > "Hello world".en_ru.ru_it.language
    => "it"


Arrays also includes Yatran::Translatable module 

    1.9.3p125 :015 > ["hello", "goodbye"].en_tr
     => ["merhaba", "elveda"] 
    1.9.3p125 :017 > ["hello", "goodbye"].from_en_to_ru
     => ["Привет", "до свидания"] 


Direct translate method

    1.9.3p125 :008 > ["hello", "goodbye"].translate('en-tr')
     => ["merhaba", "elveda"] 
    1.9.3p125 :009 > "hello".translate("en-tr")
     => "merhaba"


Avaliable directions
    
    1.9.3p125 :031 > String.translation_directions
     => ["ru-en", "ru-pl", "ru-uk", "ru-de", "ru-fr", "ru-es", "ru-it", "ru-tr", "en-ru", "en-uk", "en-tr", "pl-ru", "uk-ru", "uk-en", "de-ru", "fr-ru", "es-ru", "it-ru", "tr-ru", "tr-en"] 
    1.9.3p125 :032 > Array.translation_directions
     => ["ru-en", "ru-pl", "ru-uk", "ru-de", "ru-fr", "ru-es", "ru-it", "ru-tr", "en-ru", "en-uk", "en-tr", "pl-ru", "uk-ru", "uk-en", "de-ru", "fr-ru", "es-ru", "it-ru", "tr-ru", "tr-en"] 
    1.9.3p125 :033 > Yatran::LANGUAGES_TRANSLATIONS
     => ["ru-en", "ru-pl", "ru-uk", "ru-de", "ru-fr", "ru-es", "ru-it", "ru-tr", "en-ru", "en-uk", "en-tr", "pl-ru", "uk-ru", "uk-en", "de-ru", "fr-ru", "es-ru", "it-ru", "tr-ru", "tr-en"] 
        



## Installation

Add this line to your application's Gemfile:

    gem 'yatran'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yatran

## Usage

 Terms of use (free access, up to 10,000 request a day or 1,000,000 requested characters)
 At the moment it supports the following lang pairs:
 http://translate.yandex.net/api/v1/tr/getLangs

 More info

 English version: http://translate.yandex.net/tr-url/en+ru.ru/api.yandex.ru/translate/  (translated automatically)
 Russian version: http://api.yandex.ru/translate/


## CLI 
/bin/yaran is a cli utility to use yandex translation API 

    ./yatran -h
 
    Yandex Command line translations.
    Available language directions : ru-en,ru-pl,ru-uk,ru-de,ru-fr,ru-es,ru-it,ru-tr,en-ru,en-uk,en-tr,pl-ru,uk-ru,uk-en,de-ru,fr-ru,es-ru,it-ru,tr-ru,tr-en
    Usage: yatran COMMAND [OPTIONS]


    Commands

        d: detect text language
        t: translate text

    Options
    
        -p, --phrase Phrase [OPT]        Phrase to translate or detect
        -s, --source FILE [OPT]          File with text to translate
        -o, --output FILE [OPT]          File with output
        -f, --from FROM_LANG [OPT]       Language of phrase/text 
        -t, --to TO_LANG [OPT]           Output language 
        -l, --language LANGDIR [OPT]     Available language direction
        -d, --debug                      Debug flag   



