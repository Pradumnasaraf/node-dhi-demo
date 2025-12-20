#!/bin/bash

echo "=========================================="
echo "Testing Note API Routes"
echo "=========================================="
echo ""

echo "1. Testing Root Endpoint (GET /)"
echo "--------------------------------"
curl -s http://localhost:3000/ | python3 -m json.tool
echo ""
echo ""

echo "2. Testing Health Check (GET /health)"
echo "-------------------------------------"
curl -s http://localhost:3000/health | python3 -m json.tool
echo ""
echo ""

echo "3. Testing GET All Notes (GET /api/notes)"
echo "------------------------------------------"
curl -s http://localhost:3000/api/notes | python3 -m json.tool
echo ""
echo ""

echo "4. Testing Create Note (POST /api/notes)"
echo "-----------------------------------------"
curl -s -X POST http://localhost:3000/api/notes \
  -H "Content-Type: application/json" \
  -d '{"title": "My First Note", "content": "This is a test note created via API"}' | python3 -m json.tool
echo ""
echo ""

echo "5. Testing Create Another Note (POST /api/notes)"
echo "-------------------------------------------------"
curl -s -X POST http://localhost:3000/api/notes \
  -H "Content-Type: application/json" \
  -d '{"title": "Shopping List", "content": "Milk, Bread, Eggs"}' | python3 -m json.tool
echo ""
echo ""

echo "6. Testing GET All Notes Again (GET /api/notes)"
echo "------------------------------------------------"
curl -s http://localhost:3000/api/notes | python3 -m json.tool
echo ""
echo ""

echo "7. Testing GET Single Note (GET /api/notes/1)"
echo "----------------------------------------------"
curl -s http://localhost:3000/api/notes/1 | python3 -m json.tool
echo ""
echo ""

echo "8. Testing GET Non-existent Note (GET /api/notes/999)"
echo "------------------------------------------------------"
curl -s http://localhost:3000/api/notes/999 | python3 -m json.tool
echo ""
echo ""

echo "9. Testing DELETE Note (DELETE /api/notes/1)"
echo "----------------------------------------------"
curl -s -X DELETE http://localhost:3000/api/notes/1 | python3 -m json.tool
echo ""
echo ""

echo "10. Testing GET All Notes After Deletion (GET /api/notes)"
echo "----------------------------------------------------------"
curl -s http://localhost:3000/api/notes | python3 -m json.tool
echo ""
echo ""

echo "11. Testing POST with Missing Fields (POST /api/notes)"
echo "-------------------------------------------------------"
curl -s -X POST http://localhost:3000/api/notes \
  -H "Content-Type: application/json" \
  -d '{"title": "Incomplete Note"}' | python3 -m json.tool
echo ""
echo ""

echo "=========================================="
echo "All Tests Completed!"
echo "=========================================="


