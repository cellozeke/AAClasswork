import { RECEIVE_STEP, RECEIVE_STEPS, REMOVE_STEP } from "../actions/step_actions";

const initialState = {
  1: {
    id: 1,
    title: 'walk to store',
    done: false,
    todo_id: 1
  },
  2: {
    id: 2,
    title: 'buy soap',
    done: false,
    todo_id: 1
  }
};

const stepsReducer = (state = initialState, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);
  switch (action.type) {
    case RECEIVE_STEP:
      nextState[action.step.id] = action.step;
      return nextState;
    case RECEIVE_STEPS:
      let stepsObj = {} 
      action.steps.forEach( (obj) =>{
        stepsObj[obj.id] = obj
      })
      return stepsObj;
    case REMOVE_STEP:
      delete nextState[action.step.id];
      return nextState;
    default:
      return state;
  };
};

export default stepsReducer;
