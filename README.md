# The-dialog-system-in-Godot-4

<img src="https://img.shields.io/badge/Godot-4.x-%2523478cbf" alt="">

A flexible dialogue system for Godot 4 with rich text formatting, character portraits, and multiple response options.

## Features
<ul>
  <li>Rich text support with multiple fonts (normal, monospace, italic, bold, bold-italic)</li>
  <li> Character portraits with name display</li>
  <li>Adjustable text reveal speed with skip functionality</li>
  <li>Multiple dialog types:</li>
      <ul> 
        <li>Single-page (exit only)</li>
        <li>Multi-page (next/previous)</li>
        <li>Choice-based (yes/no options)</li>
      </ul>
  <li>Built-in localization support using Godot's translation system</li>
  <li>Customizable UI with background textures</li>
</ul>

## Installation
<ol>
  <li>Copy DialogBox.gd to your project's scripts folder</li>
  <li>Create a new scene with the following node structure:</li>
<ul>
  <li>
    <strong>DialogBox</strong> (Node2D)
    <ul>
      <li>
        <strong>CanvasLayer</strong>
        <ul>
          <li>
            <strong>Control</strong>
            <ul>
              <li>
                <strong>Background</strong> (Sprite2D)
                <ul>
                  <li><strong>Text</strong> (RichTextLabel)</li>
                  <li><strong>NameLabel</strong> (Label)</li>
                  <li><strong>Speaker</strong> (Sprite2D)</li>
                  <li><strong>end</strong> (Button)</li>
                  <li><strong>yes</strong> (Button)</li>
                  <li><strong>no</strong> (Button)</li>
                  <li><strong>next</strong> (Button)</li>
                </ul>
              </li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  </li>
</ul>
    <li>Attach the DialogBox.gd script to the root Node2D</li>
    <li>Configure exported properties in the Inspector</li>
</ol>

## Configuration

<table border="1">
  <tr>
    <th>Свойство</th>
    <th>Тип</th>
    <th>Описание</th>
  </tr>
  <tr>
    <td>speaker</td>
    <td>Texture2D</td>
    <td>Character portrait texture</td>
  </tr>
  <tr>
    <td>speaker_name</td>
    <td>String</td>
    <td>Speaker's display name</td>
  </tr>
  <tr>
    <td>background</td>
    <td>Texture2D</td>
    <td>Dialog window background</td>
  </tr>
  <tr>
    <td>normal_font</td>
    <td>FontFile</td>
    <td>Primary font for dialog text</td>
  </tr>
  <tr>
    <td>mono_font</td>
    <td>FontFile</td>
    <td>Monospaced font for code/technical text</td>
  </tr>
  <tr>
    <td>italics_font</td>
    <td>FontFile</td>
    <td>Font for cursive text</td>
  </tr>
  <tr>
    <td>bold_italics_font</td>
    <td>FontFile</td>
    <td>Bold italic font for special emphasis</td>
  </tr>
  <tr>
    <td>bold_font</td>
    <td>FontFile</td>
    <td>Bold font for headers/keywords</td>
  </tr>
  <tr>
    <td>opentext_speed</td>
    <td>float</td>
    <td>Text reveal speed (higher = faster)</td>
  </tr>
</table>

## License

Free for personal and commercial use

