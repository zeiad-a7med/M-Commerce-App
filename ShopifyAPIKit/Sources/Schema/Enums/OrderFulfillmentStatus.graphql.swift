// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

/// Represents the order's aggregated fulfillment status for display purposes.
public enum OrderFulfillmentStatus: String, EnumType {
  /// Displayed as **Unfulfilled**. None of the items in the order have been fulfilled.
  case unfulfilled = "UNFULFILLED"
  /// Displayed as **Partially fulfilled**. Some of the items in the order have been fulfilled.
  case partiallyFulfilled = "PARTIALLY_FULFILLED"
  /// Displayed as **Fulfilled**. All of the items in the order have been fulfilled.
  case fulfilled = "FULFILLED"
  /// Displayed as **Restocked**. All of the items in the order have been restocked. Replaced by "UNFULFILLED" status.
  case restocked = "RESTOCKED"
  /// Displayed as **Pending fulfillment**. A request for fulfillment of some items awaits a response from the fulfillment service. Replaced by "IN_PROGRESS" status.
  case pendingFulfillment = "PENDING_FULFILLMENT"
  /// Displayed as **Open**. None of the items in the order have been fulfilled. Replaced by "UNFULFILLED" status.
  case open = "OPEN"
  /// Displayed as **In progress**. Some of the items in the order have been fulfilled, or a request for fulfillment has been sent to the fulfillment service.
  case inProgress = "IN_PROGRESS"
  /// Displayed as **On hold**. All of the unfulfilled items in this order are on hold.
  case onHold = "ON_HOLD"
  /// Displayed as **Scheduled**. All of the unfulfilled items in this order are scheduled for fulfillment at later time.
  case scheduled = "SCHEDULED"
}
