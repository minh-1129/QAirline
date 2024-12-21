import { NextResponse } from 'next/server'
import fs from 'fs'
import path from 'path'

export async function GET() {
  try {
    const filePath = path.join(process.cwd(), 'public', 'departure-flights.json')
    const fileContents = await fs.promises.readFile(filePath, 'utf8')
    const data = JSON.parse(fileContents)
    return NextResponse.json(data)
  } catch (error) {
    console.error('Error reading departure flights:', error)
    return NextResponse.json({ error: 'Failed to fetch departure flights' }, { status: 500 })
  }
}

