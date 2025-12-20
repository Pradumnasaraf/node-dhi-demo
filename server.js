const express = require('express');
const bodyParser = require('body-parser');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// In-memory storage for notes
let notes = [];
let nextId = 1;

// Routes

// GET all notes
app.get('/api/notes', (req, res) => {
  res.json({
    success: true,
    count: notes.length,
    notes: notes
  });
});

// GET a single note by ID
app.get('/api/notes/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const note = notes.find(n => n.id === id);
  
  if (!note) {
    return res.status(404).json({
      success: false,
      message: 'Note not found'
    });
  }
  
  res.json({
    success: true,
    note: note
  });
});

// POST create a new note
app.post('/api/notes', (req, res) => {
  const { title, content } = req.body;
  
  if (!title || !content) {
    return res.status(400).json({
      success: false,
      message: 'Title and content are required'
    });
  }
  
  const note = {
    id: nextId++,
    title: title,
    content: content,
    createdAt: new Date().toISOString()
  };
  
  notes.push(note);
  
  res.status(201).json({
    success: true,
    message: 'Note created successfully',
    note: note
  });
});

// DELETE a note by ID
app.delete('/api/notes/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const noteIndex = notes.findIndex(n => n.id === id);
  
  if (noteIndex === -1) {
    return res.status(404).json({
      success: false,
      message: 'Note not found'
    });
  }
  
  notes.splice(noteIndex, 1);
  
  res.json({
    success: true,
    message: 'Note deleted successfully'
  });
});

// Health check route
app.get('/health', (req, res) => {
  res.json({
    status: 'OK',
    timestamp: new Date().toISOString()
  });
});

// Root route
app.get('/', (req, res) => {
  res.json({
    message: 'Welcome to the Note API',
    endpoints: {
      'GET /api/notes': 'Get all notes',
      'GET /api/notes/:id': 'Get a single note',
      'POST /api/notes': 'Create a new note',
      'DELETE /api/notes/:id': 'Delete a note',
      'GET /health': 'Health check'
    }
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
  console.log(`Health check: http://localhost:${PORT}/health`);
  console.log(`API endpoint: http://localhost:${PORT}/api/notes`);
});


