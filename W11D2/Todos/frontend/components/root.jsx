import React from "react";
import { Provider } from "react-redux";
import App from "./app";

export default class Root extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      banks: [],
    };
  }

  componentDidMount() {
    this.getBanks();
  }

  getBanks() {
    fetch("https://random-data-api.com/api/bank/random_bank?size=3")
      .then((res) => {
        return res.json();
      })
      .then((res) => {
        this.setState({ banks: res });
      });
  }

  handleClick = (e) => {
    this.getBanks();
  }

  render() {
    return (
      <div>
        {this.state.banks.map((bank) => (
          <li key={bank.id}>{bank.bank_name}</li>
        ))}
        <button onClick={this.handleClick}>Reload</button>
      </div>
    );
  }
}
