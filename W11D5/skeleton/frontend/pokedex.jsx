import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store';
import { fetchAllPokemon } from './util/api_util';

document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
  const store = configureStore();
  window.getState = store.getState; 
  window.dispatch = store.dispatch
  // window.store = store;
  window.fetchAllPokemon = fetchAllPokemon;
  window.requestAllPokemon  = requestAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
});
