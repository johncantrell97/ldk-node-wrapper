// This file is Copyright its original authors, visible in version contror
// history.
//
// This file is licensed under the Apache License, Version 2.0 <LICENSE-APACHE
// or http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
// <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your option.
// You may not use this file except in accordance with one or both of these
// licenses.
use ldk_node::bitcoin::Network;

use crate::error::Error;

pub(crate) fn network_from_token(token: &str) -> Result<Network, Error> {
	if token.len() == 0 {
		return Err(Error::InvalidAPIToken);
	}

	match token.chars().next() {
		Some('R') => Ok(Network::Regtest),
		Some('T') => Ok(Network::Testnet),
		Some('S') => Ok(Network::Signet),
		Some('M') => Ok(Network::Bitcoin),
		_ => Err(Error::InvalidAPIToken),
	}
}

#[cfg(test)]
mod test {
	use super::*;

	#[test]
	fn empty_token_is_invalid() {
		assert_eq!(network_from_token(""), Err(Error::InvalidAPIToken));
	}

	#[test]
	fn regtest_token() {
		assert_eq!(network_from_token("Rsometoken"), Ok(Network::Regtest));
	}

	#[test]
	fn testnet_token() {
		assert_eq!(network_from_token("Tsometoken"), Ok(Network::Testnet));
	}

	#[test]
	fn signet_token() {
		assert_eq!(network_from_token("Ssometoken"), Ok(Network::Signet));
	}

	#[test]
	fn mainnet_token() {
		assert_eq!(network_from_token("Msometoken"), Ok(Network::Bitcoin));
	}

	#[test]
	fn invalid_token() {
		assert_eq!(network_from_token("Gsometoken"), Err(Error::InvalidAPIToken));
	}
}
