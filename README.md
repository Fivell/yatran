Ruby unofficial client for Yandex translation engine


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
    1.9.2p320 :007 > "Hello world".en_ru.ru_it.language
    => "it"
    1.9.2p320 :008 > Yatran::LANGUAGES_TRANSLATIONS
    => ["ru-en", "ru-pl", "ru-uk", "ru-de", "ru-fr", "ru-es", "ru-it", "ru-tr", "en-ru", "en-uk", "en-tr", "pl-ru", "uk-ru", "uk-en", "de-ru", "fr-ru", "es-ru", "it-ru", "tr-ru", "tr-en"]
    1.9.2p320 :009 > "Hello world".respond_to?("en_ru")
    => true
    1.9.2p320 :010 > "Hello world".respond_to?("from_en_to_ru")
    => true
    1.9.2p320 :011 > "Hello world".respond_to?("to_ru_from_en")
    => true




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

 English version: http://translate.yandex.net/tr-url/en+ru.ru/api.yandex.ru/translate/  (tranlated automatically)
 Russian version: http://api.yandex.ru/translate/


## CLI

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
    -t TO_LANG [OPT]output language ,
        --to
    -l, --language LANGDIR [OPT]     available language direction
    -d, --debug                      Debug flag



