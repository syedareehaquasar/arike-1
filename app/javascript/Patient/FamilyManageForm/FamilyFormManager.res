type state = {
  relations: array<option<string>>,
  educations: array<option<string>>,
  occupations: array<option<string>>,
  members: array<FamilyMemberForm.FamilyMember.t>,
}
type props = state

let s = React.string

let count = ref(1)

type action =
  | AddFamilyMember
  | DeleteFamilyMember(FamilyMemberForm.FamilyMember.t)

let reducer = (state, action) =>
  switch action {
  | AddFamilyMember => {
      ...state,
      members: Belt.Array.concat(
        state.members,
        [FamilyMemberForm.FamilyMember.make(~id=Belt.Int.toString(count.contents))],
      ),
    }
  | DeleteFamilyMember(member) => {
      ...state,
      members: Js.Array.filter(m => FamilyMemberForm.FamilyMember.getId(m) != member.id, state.members),
    }
  }

@react.component
let make = (~props) => {
  let initialState = props
  let (state, dispatch) = React.useReducer(reducer, initialState)
  let len = Js.Array.length(state.members)

  if(len === 0)
  {
    AddFamilyMember->dispatch
  }
  else if len > 0 {
    count := count.contents + len - 1
  } else {
    count := count.contents
  }

  <div className="max-w-3xl mx-auto mt-8 relative">
    {state.members
        ->Belt.Array.map(props => {
          <FamilyMemberForm
            props
            key={Js.Option.getWithDefault("", props.id)}
            onClick={_mouseEvt => {
              DeleteFamilyMember(props)->dispatch}
            }
            relations={state.relations}
            educations={state.educations}
            occupations={state.occupations}
          />
        })
        ->React.array
      }
    <div className="flex">
      <button
        className="mt-4 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        onClick={mouseEvt => {
          count := count.contents + 1
          mouseEvt->ReactEvent.Mouse.preventDefault
          AddFamilyMember->dispatch
        }}>
        {s("Add Family Member")}
      </button>
      {if count.contents > 0 {
        <button
          type_="submit"
          className="ml-4 mt-4 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
          {s("Save")}
        </button>
      } else {
        React.null
      }}
    </div>
  </div>
}
