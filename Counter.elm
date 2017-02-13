import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

app =
  Html.beginnerProgram {model = model, view = view, update = update}

main =
  app

type alias Model = Int

model : Model
model = 1

type Msg = Increment Int | Decrement | Reset

view : Model -> Html Msg
view model =
  div []
    [ h1 [] [text "Pluralizer"]
    , button [onClick (Increment 5)] [text "Add shelf"]
    , br [] []
    , text (toString model ++ " " ++ pluralize "shelf" "shelves" model)
    , br [] []
    , button [onClick Decrement, disabled (model <= 0)] [text "Remove shelf"]
    , br [] []
    , button [onClick Reset] [text "Reset"]
    ]

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment step ->
      model + step
    Decrement ->
      model - 1
    Reset ->
      1

pluralize : String -> String -> Int -> String
pluralize singular plural count =
  if count == 1 then
    singular
  else
    plural
