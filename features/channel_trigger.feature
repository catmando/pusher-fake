@javascript
Feature: Triggering events on a channel

  Background:
    Given I am connected
    And Bob is connected

  Scenario: Client triggers a client event on a subscribed private channel
    Given I am subscribed to the "private-chat" channel
    And Bob is subscribed to the "private-chat" channel
    When I trigger the "client-message" event on the "private-chat" channel
    Then I should receive a "client-message" event on the "private-chat" channel
    And Bob should receive a "client-message" event on the "private-chat" channel

  Scenario: Client triggers a client event on a previously subscribed private channel
    Given I am subscribed to the "private-chat" channel
    And Bob is subscribed to the "private-chat" channel
    And I unsubscribe from the "private-chat" channel
    When I manually trigger the "client-message" event on the "private-chat" channel
    Then I should not receive a "client-message" event on the "private-chat" channel
    And Bob should not receive a "client-message" event on the "private-chat" channel

  Scenario: Client triggers a client event on an unsubscribed private channel
    Given Bob is subscribed to the "private-chat" channel
    When I manually trigger the "client-message" event on the "private-chat" channel
    Then I should not receive a "client-message" event on the "private-chat" channel
    And Bob should not receive a "client-message" event on the "private-chat" channel

  Scenario: Client triggers a client event on a subscribed public channel
    Given I am subscribed to the "chat" channel
    And Bob is subscribed to the "chat" channel
    When I trigger the "client-message" event on the "chat" channel
    Then I should not receive a "client-message" event on the "chat" channel
    And Bob should not receive a "client-message" event on the "chat" channel
