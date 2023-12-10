module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Events as Events
import Element.Font as Font
import Html exposing (Html)



-- SUBSCRIPTIONS
-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }



-- MODEL:
--      (basically the state that's getting passed around)
--      . data structures
--      . initial state
--      . variables


type alias Model =
    { background : Ansi16
    , font : Ansi16
    }


type Msg
    = SwapColour


type Ansi16
    = Black
    | Red
    | Green
    | Yellow
    | Blue
    | Magenta
    | Cyan
    | White
    | BrightBlack
    | BrightRed
    | BrightGreen
    | BrightYellow
    | BrightBlue
    | BrightMagenta
    | BrightCyan
    | BrightWhite


swap : Ansi16 -> Ansi16
swap ansiName =
    case ansiName of
        Black ->
            White

        White ->
            Black

        _ ->
            ansiName



-- VIEW


init : Model
init =
    { background = Black
    , font = White
    }


view : Model -> Html Msg
view model =
    layout
        [ width fill
        , height fill
        , Background.color <| getAnsiHex model.background
        , Events.onMouseEnter SwapColour
        , Events.onMouseLeave SwapColour
        ]
    <|
        el
            [ centerX
            , centerY
            , padding 50
            ]
        <|
            paragraph
                [ Font.size 48
                , Font.family
                    [ Font.external
                        { name = "IBM Plex Mono"
                        , url = "https://fonts.googleapis.com/css?family=IBM+Plex+Mono"
                        }
                    , Font.monospace
                    ]
                , Font.center
                , Font.color <| getAnsiHex model.font

                -- , explain Debug.todo
                ]
                [ text "yay! "
                , el [ Font.italic ] <| text "no"
                , text " javascript!"
                ]



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        SwapColour ->
            { model | background = swap model.background, font = swap model.font }


getAnsiHex : Ansi16 -> Color
getAnsiHex ansiName =
    case ansiName of
        Black ->
            rgb255 0x00 0x00 0x00

        Red ->
            rgb255 0x80 0x00 0x00

        Green ->
            rgb255 0x00 0x80 0x00

        Yellow ->
            rgb255 0x80 0x80 0x00

        Blue ->
            rgb255 0x00 0x00 0x80

        Magenta ->
            rgb255 0x80 0x00 0x80

        Cyan ->
            rgb255 0x00 0x80 0x80

        White ->
            rgb255 0xC0 0xC0 0xC0

        BrightBlack ->
            rgb255 0x80 0x80 0x80

        BrightRed ->
            rgb255 0xFF 0x00 0x00

        BrightGreen ->
            rgb255 0x00 0xFF 0x00

        BrightYellow ->
            rgb255 0xFF 0xFF 0x00

        BrightBlue ->
            rgb255 0x00 0x00 0xFF

        BrightMagenta ->
            rgb255 0xFF 0x00 0xFF

        BrightCyan ->
            rgb255 0x00 0xFF 0xFF

        BrightWhite ->
            rgb255 0xFF 0xFF 0xFF
