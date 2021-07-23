import React from 'react';
import Tile from './tile';

export default class Board extends React.Component {
  constructor(props) {
    super(props);
  };

  render() {
    return (
      <div className='board'>
        {this.props.board.grid.map((row, i) => <div className='row' key={i}>{row.map((tile, j) => <Tile tile={tile} updateGame={this.props.updateGame} key={j} />)}</div>)}
      </div>
    )
  };
};
