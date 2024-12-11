#include "Game.h"

Game::Game() : window(sf::VideoMode(800, 600), "Escape from the Dark Office") {}

void Game::run() {
    sf::Clock clock;
    while (window.isOpen()) {
        processEvents();
        sf::Time deltaTime = clock.restart();
        update(deltaTime);
        render();
    }
}

void Game::processEvents() {
    sf::Event event;
    while (window.pollEvent(event)) {
        if (event.type == sf::Event::Closed)
            window.close();
    }
}

void Game::update(sf::Time deltaTime) {
    player.update(deltaTime);
}

void Game::render() {
    window.clear();
    scene.render(window);
    player.render(window);
    window.display();
}