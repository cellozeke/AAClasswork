import React from 'react';

export default class Tile extends React.Component {
  constructor(props) {
    super(props);
    this.handleClick = this.handleClick.bind(this);
  };

  handleClick(e) {
    const flagged = e.altKey ? true : false;
    this.props.updateGame(this.props.tile, flagged);
  };

  render() {
    const tile = this.props.tile;
    let tileState, text, count;
    if (tile.explored) {
      if (tile.bombed) {
        tileState = 'bombed';
        text = '💣'
      } else {
        tileState = 'explored';
        count = tile.adjacentBombCount();
        text = (count > 0 ? `${count}` : '');
      };
    } else if (tile.flagged) {
      tileState = 'flagged';
      text = '🚩'
    } else {
      tileState = 'unexplored';
    };
    tileState = `tile ${tileState}`;

    return (
      <div className={tileState} onClick={this.handleClick}>{text}</div>
    );
  };
};
