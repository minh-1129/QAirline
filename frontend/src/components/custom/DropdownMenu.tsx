"use client"
import React, { useState } from 'react';

interface Link {
  name: string;
  href: string;
}

interface MenuGroup {
  title: string;
  links: Link[];
}

interface DropdownMenuProps {
  buttonLabel: string;
  menuItems: MenuGroup[];
}

const DropdownMenu: React.FC<DropdownMenuProps> = ({ buttonLabel, menuItems }) => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <div className="relative">
      {/* Button to open/close dropdown */}
      <button
        className="px-4 py-2 font-medium text-white bg-blue-600 rounded hover:bg-blue-700"
        onMouseOver={() => setIsOpen(true)}
      >
        {buttonLabel}
      </button>

      {/* Dropdown menu */}
      {isOpen && (
        <div
          className="absolute left-0 z-10 w-full bg-white border shadow-md"
          onMouseLeave={() => setIsOpen(false)} // Close dropdown on mouse leave
        >
          <div className="grid grid-cols-3 gap-4 p-4">
            {menuItems.map((menu, index) => (
              <div key={index}>
                <h3 className="mb-2 font-semibold text-gray-800">{menu.title}</h3>
                <ul className="space-y-1 text-sm">
                  {menu.links.map((link, idx) => (
                    <li key={idx}>
                      <a
                        href={link.href}
                        className="block p-1 text-gray-600 hover:text-blue-600 hover:underline"
                      >
                        {link.name}
                      </a>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
};

export default DropdownMenu;

