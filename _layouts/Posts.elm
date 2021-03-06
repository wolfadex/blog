module Posts exposing (main)

import Elmstatic exposing (..)
import Html exposing (..)
import Html.Attributes exposing (href)
import Page
import Post


main : Elmstatic.Layout
main =
    let
        postItem post =
            div []
                [ a [ href ("/blog/" ++ post.link) ] [ h2 [] [ text post.title ] ]
                , Post.metadataHtml post
                ]

        postListContent posts =
            if List.isEmpty posts then
                [ text "No posts yet!" ]

            else
                List.map postItem posts

        sortPosts posts =
            List.sortBy .date posts
                |> List.reverse
    in
    Elmstatic.layout Elmstatic.decodePostList <|
        \content ->
            Ok <| Page.layout content.title <| postListContent <| sortPosts content.posts
