module Post exposing (main, metadataHtml)

import Elmstatic exposing (..)
import Html exposing (..)
import Html.Attributes exposing (class, href)
import Page


tagsToHtml : List String -> List (Html Never)
tagsToHtml tags =
    let
        tagLink tag =
            "/tags/" ++ String.toLower tag

        linkify tag =
            a [ href <| tagLink tag ] [ text tag ]
    in
    List.map linkify tags
        |> List.intersperse metaSpacer


metadataHtml : Elmstatic.Post -> Html Never
metadataHtml post =
    div []
        ([ span [] [ text post.date ]
         , metaSpacer
         ]
            ++ tagsToHtml post.tags
        )


metaSpacer : Html Never
metaSpacer =
    span [] [ text " • " ]


main : Elmstatic.Layout
main =
    Elmstatic.layout Elmstatic.decodePost <|
        \content ->
            Ok <|
                Page.layout
                    content.title
                    [ metadataHtml content, Page.markdown content.content ]
