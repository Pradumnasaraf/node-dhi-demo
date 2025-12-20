# Node DHI Demo - Note API

A simple RESTful note-taking API built with Express.js and Docker.

## Quick Start

```bash
# Using Docker Compose
docker compose up --build

# Or locally
npm install
npm start
```

API available at `http://localhost:3000`

## API Endpoints

- `GET /` - API documentation
- `GET /health` - Health check
- `GET /api/notes` - Get all notes
- `GET /api/notes/:id` - Get single note
- `POST /api/notes` - Create note (requires `title` and `content`)
- `DELETE /api/notes/:id` - Delete note

## Example Usage

```bash
# Create a note
curl -X POST http://localhost:3000/api/notes \
  -H "Content-Type: application/json" \
  -d '{"title": "My Note", "content": "Note content"}'

# Get all notes
curl http://localhost:3000/api/notes

# Delete a note
curl -X DELETE http://localhost:3000/api/notes/1
```

## Testing

```bash
./test-routes.sh
```

## Tech Stack

- Node.js 22
- Express.js
- Docker & Docker Compose

## License

MIT
