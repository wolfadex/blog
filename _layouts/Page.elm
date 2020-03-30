module Page exposing (footer, header, layout, main, markdown)

import Elmstatic exposing (..)
import Html exposing (..)
import Html.Attributes exposing (attribute, class, href, src)
import Markdown


markdown : String -> Html Never
markdown s =
    let
        mdOptions : Markdown.Options
        mdOptions =
            { defaultHighlighting = Just "elm"
            , githubFlavored = Just { tables = False, breaks = False }
            , sanitize = False
            , smartypants = True
            }
    in
    Markdown.toHtmlWith mdOptions [ attribute "class" "markdown" ] s


header : Html Never
header =
    Html.header []
        [ h1 []
            [ text "The Toolshed"
            , img [ src "/blog/img/logo.svg", class "title-logo" ] []
            ]
        , small [] [ text "Musings on web development tools" ]
        ]


footer : Html Never
footer =
    Html.footer []
        [ a [ href "https://github.com/wolfadex" ]
            [ text "GitHub" ]
        , a [ href "https://twitter.com/wolfadex" ]
            [ text "Twitter" ]
        , a [ href "https://www.linkedin.com/in/twolfgangschuster/" ]
            [ text "LinkedIn" ]
        , a [ href "https://www.npmjs.com/package/elmstatic" ]
            [ text "Created with Elmstatic" ]
        ]


layout : String -> List (Html Never) -> List (Html Never)
layout title contentItems =
    [ header
    , nav
        []
        [ a [ href "/blog/posts" ]
            [ text "Posts" ]
        , a [ href "/blog/about" ]
            [ text "About" ]
        , a [ href "/blog/projects" ]
            [ text "Projects" ]
        , a [ href "/blog/contact" ]
            [ text "Contact" ]
        ]
    , main_
        [ class "main-content" ]
        (h1 [] [ text title ] :: contentItems)
    , footer
    , Elmstatic.stylesheet "/blog/styles.css"
    ]


main : Elmstatic.Layout
main =
    Elmstatic.layout Elmstatic.decodePage <|
        \content ->
            Ok <| layout content.title [ markdown content.content ]
